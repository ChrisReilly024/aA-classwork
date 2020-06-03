require_relative 'piece'
class King < Piece 
    include Stepable
    #King is inheriting 
    #@color = symbol
    #reference to @board
    #@pos
    #King.new(color, board, pos)
    #to_s
    #empty?
    #valid_moves
    #pos=(val)
    #symbol
    # private -> move_into_check?(end_pos)

    def symbol
        :K
    end

    def move_diffs #overwritten by THIS class from Steppable

    end

end