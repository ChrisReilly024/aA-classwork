require_relative "board.rb"
class Piece
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        "#{symbol}" 
    end 

    def empty?(pos)
        @board[pos].nil?
    end

    def valid_moves
        
    end

    def pos=(val)
    end

    def symbol 
        
    end

    private

    def move_into_check?(end_pos)
    end



end


