# require_relative 'pawn'
# require_relative 'rook_bishop_queen'
# require_relative 'knight_king'
# require_relative 'null_piece'

class Piece   
    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        @color = color
        @pos = pos
        @board = board        
    end

    def to_s

    end

    def empty?
        
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