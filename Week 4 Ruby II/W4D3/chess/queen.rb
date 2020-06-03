require_relative "slideable"
require_relative 'piece'

class Queen < Piece 
    #Queen is inheriting 
    #@color = symbol
    #reference to @board
    #@pos
    #Queen.new(color, board, pos)
    #to_s
    #empty?
    #valid_moves
    #pos=(val)
    #symbol
    # private -> move_into_check?(end_pos)
    include Slideable
    def symbol
        :Q
    end

    protected
    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
end