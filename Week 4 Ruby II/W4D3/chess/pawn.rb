require_relative 'piece'
class Pawn < Piece
    #Pawn is inheriting 
    #@color = symbol
    #reference to @board
    #@pos ----------
    #Pawn.new(color, board, pos)
    #to_s
    #empty?
    #valid_moves
    #pos=(val)
    #symbol
    # private -> move_into_check?(end_pos)


    def symbol #what we're referring to for movement
        :Pwn
    end

    def move_dirs #depends on color and starting position of board
        forward_dir
    end

    private

    def forward_dir #returns 1 or -1
        if color == :W #Lets say white starts top, moves row + 1
            @pos[0] += 1
        else 
            @pos[0] -= 1
        end
    end

    def foward_steps #if forward space is empty, able to move, direction depends on color
    end

    def side_attacks #if space diagonal, depending on color

    end
end