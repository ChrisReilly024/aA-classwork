class Board
    def initialize
        @rows = Array.new(8) { Array.new(8)}
        @sentinel = NullPiece
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        

end