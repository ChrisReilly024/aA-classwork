require_relative "piece.rb"
# require_relative "null"

class Board
    def initialize
        @rows = Array.new(8) { Array.new(8)}
        # @sentinel = NullPiece.new

        @rows.each_with_index do |row,i|
            if i == 0 || i == 1 || i == 6 || i == 7
                row.map! {|ele| Piece.new }
            end
        end
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(color, start_pos, end_pos)
        raise 'Empty spot chief'if self[start_pos].nil? 
        raise "can't go there chief" if !self[end_pos].nil?    
        self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end

    def valid_pos?(pos)
        
    end

    def add_piece(piece, pos)
    end

    def checkmate?(color)
    end

    def in_check?(color)
    end

    def find_king(color)
    end

    def pieces
    end

    def dup
    end

    def move_piece!(color, start_pos, end_pos) #This one with a !
    end



end