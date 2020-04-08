require_relative 'piece'

class RookBishopQueen < Piece


    def initialize
        super(color, board, position)
    end

    def symbol
    end

    protected

    def move_dirs
    end
end