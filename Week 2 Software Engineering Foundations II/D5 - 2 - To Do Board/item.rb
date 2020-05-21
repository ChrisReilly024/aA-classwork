class Item
    # attr_reader :title, :deadline, :description
    attr_accessor :title, :deadline, :description
    def self.valid_date?(date)
        return false if date[0..3].to_i < 1000
        return false if date[5..6].to_i > 12
        return false if date[8..9].to_i > 31
        true
    end
     
    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
    end
end

