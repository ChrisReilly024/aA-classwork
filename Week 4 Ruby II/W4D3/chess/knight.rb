require_relative 'piece'
class Knight < Piece
    include Stepable
    #Knight is inheriting 
    #@color = symbol
    #reference to @board
    #@pos
    #Knight.new(color, board, pos)
    #to_s
    #empty?
    #valid_moves
    #pos=(val)
    #symbol
    # private -> move_into_check?(end_pos)

    def symbol
        :Kn
    end

    def move_diffs #overwritten by THIS class from Steppable
    end

end