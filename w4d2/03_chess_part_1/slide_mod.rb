module Slideable
    
    def horizontal_dirs
    end
    
    def diagonal_dirs
        
    end
    
    def moves
        
    end   
    
    private
    
                     # right    up     down     left
    HORIZONTAL_DIRS = [[1,0], [0,1], [0,-1], [-1,0]]
                  # rt-up    lt-dw    lt-up   rt-dw
    DIAGONAL_DIRS = [[1,1], [-1,-1], [-1,1], [1,-1]]

    def move_dirs #overwritten by subclass

    end

    def grow_unblocked_moves_in_dir(dx,dy)

    end


end