require_relative 'piece'

class Board 
    attr_reader :board, :sentinel
    def initialize
        @sentinel = :N
        @grid = Array.new(8) {Array.new(8, @sentinel)}
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @grid[x][y] = val
    end
    
    def move_piece(start_pos, end_pos)
        unless valid_pos?(start_pos) || valid_pos?(end_pos)
            raise "not a valid position"
        else 
            self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
        end

        # if @grid[start_pos] 
        # The Board class should have a #move_piece(start_pos, end_pos) method. This should update the 2D grid and also the moved piece's position. You'll want to raise an exception if:        
        # there is no piece at start_pos or
        # the piece cannot move to end_pos.

    end

    def print_grid
        @grid.each {|row| puts row.join(" ")}
    end

    def valid_pos?(pos)
        !(pos[0] < 0 || pos[0] > 7) && !(pos[1] < 0 || pos[1] > 7)
    end

    def add_piece(piece, pos)
        self[pos] = piece
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
