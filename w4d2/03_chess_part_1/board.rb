require_relative 'piece'

class Board < Piece

    def initialize(rows, sentinel)
        @rows = Array.new(8) {Array.new(8, "_" )}
        @sentinel = NullPiece
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @rows[x][y] = val
    end

    def move_piece(color, start_pos, end_pos)

    end

    def valid_pos?(pos)

    end

    def add_piece(piece, pos)

    end

    def checkmate?(color)

    end

    def find_king(color)

    end

    def pieces
    end

    def dup

    end

    def move_piece!(color, start_pos, end_pos)

    end

end