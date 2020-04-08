require_relative 'piece'
require_relative "rook_bishop_queen"
require_relative "slide_mod"

class Board 
    attr_reader :sentinel, :populate
    attr_accessor :grid
    def initialize
        @sentinel = :n
        @grid = Array.new(8) {Array.new(8, @sentinel)}
        populate
    end

    def populate
        place_pawns
        place_rook
        place_knight
        place_king
        place_queen
        # place_bishop
    end
    
    def place_pawns
        #Pawn.new
        grid[1].map! {|sqr| :P} 
        grid[6].map! {|sqr| :P}
    end

    def place_rook
        # Rook.new
        sqrs = [[0,0], [0,7], [7,0], [7,7]]
        sqrs.each {|pos| self[pos] = Rook.new(:W, grid, pos)}
    end
    def place_knight
        # Knight.new
        sqrs = [[0,1], [0,6], [7,1], [7,6]]
        sqrs.each {|pos| self[pos] = :K}
    end
    
    # def place_bishop
    #     # Bishop.new
    #     sqrs = [[0,2], [0,5], [7,2], [7,5]]
    #     sqrs.each {|pos| self[pos] = :B}
    # end
    def place_queen
        # Queen.new
        self[[0,3]] = :Q 
        self[[7,4]] = :Q
    end
    def place_king
        # King.new
        self[[0,4]] = :K
        self[[7,3]] = :K
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @grid[x][y] = val
    end
    
    def move_piece!(start_pos, end_pos)
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
        return false if (pos[0] < 0 || pos[0] > 7) || (pos[1] < 0 || pos[1] > 7) || @grid[pos] != sentinel
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

    def move_piece(color, start_pos, end_pos)
        raise "Not your piece" if current_player.color != start_pos.color
        raise "You already have a piece there" if end_pos.color == start_pos.color
    end

end
