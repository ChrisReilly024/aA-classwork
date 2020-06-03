require_relative 'board'

module Slideable
    HORIZONTAL_DIRS = [[0,1],[0,-1], [1,0],  [-1,0]] #Horizontal | Vertical
    DIAGONAL_DIRS = [[1,1], [-1,1], [1,-1], [-1,-1]]

    def horizontal_dirs 
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        move = []
        move_dirs.each do |box|
            dx, dy = box
            move << grow_unblocked_moves_in_dir(dx,dy)
        end
        move            
    end

    private 
   
    def grow_unblocked_moves_in_dir(dx, dy) #are dx, dy long destination coordinates or small increments of +1?
        possible_moves = []
        copy = @pos.dup
        x,y = copy
        new_pos = [x + dx, y + dy]

        until !@board.valid_pos?(new_pos)
            possible_moves << new_pos
            x,y = new_pos
            new_pos = [x + dx, y + dy]             
        end        
        possible_moves
    end

    def move_dirs #overwritten by subclass
    end

end