require_relative 'piece'

class Queen < Piece


    def initialize
        super(color, board, position)
    end

    def symbol
    end

    protected

    def move_dirs
    end
end

class Bishop < Piece


    def initialize
        super(color, board, position)
    end

    def symbol
    end

    protected

    def move_dirs
    end
end

class Rook < Piece


    def initialize
        super(color, board, position)
    end

    def symbol
    end

    protected

    def move_dirs
    end
end