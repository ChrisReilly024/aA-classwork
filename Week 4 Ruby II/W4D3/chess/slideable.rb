class Slideable
    HORIZONTAL_DIRS = [[0,1],[0,-1], [1,0],  [-1,0]] #Horizontal | Vertical
    DIAGONAL_DIRS = [[1,1], [-1,1], [1,-1], [-1,-1]]

    def horizontal_dirs 
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end
    
    def moves
        
    end

    private
    
    def grow_unblocked_moves_in_dir(dx, dy)
        x,y = self.pos
        new_pos = [x + dx , y + dy]
    end

    def move_dirs #overwritten by subclass

    end

end