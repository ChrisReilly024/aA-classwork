require 'sqlite3'
require 'singleton'

class QuestionDBConnection < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Question
    attr_accessor :title, :body, :author_id, :id
    def self.all
        data = QuestionDBConnection.instance.execute("SELECT * FROM questions")
        data.map { |datum| Question.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

    def create
        raise "#{self} already in database" if @id
        QuestionDBConnection.instance.execute(<<-SQL, @title, @body, @author_id)
            INSERT INTO
                questions (title, body, author_id)
            VALUES
                (?,?,?)
        SQL
        @id = QuestionDBConnection.instance.last_insert_row_id
    end

    def update
        raise "not in database" unless @id
        QuestionDBConnection.instance.execute(<<-SQL, @title, @body, @author_id)
            UPDATE 
                questions 
            SET 
                title = ?, body = ?, author_id = ?
            WHERE
                id = ?
            SQL
    end

    def self.find_by_id(id)
        search = QuestionDBConnection.instance.execute(<<-SQL, id)
        SELECT 
            * 
        FROM 
            questions 
        WHERE 
         questions.id = ?
          
        SQL
        # return nil if search.empty?
        search.first
    end
end