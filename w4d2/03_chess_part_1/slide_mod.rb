module Slideable
    
    def horizontal_dirs
        HORIZONTAL_DIRS 
    end
    
    def diagonal_dirs
        DIAGONAL_DIRS
    end
    
    def moves
        possibles = []
        self.move_dirs.each do |delta|
            possibles += grow_unblocked_moves_in_dir(delta[0], delta[-1])
        end
        possibles
    end   
    
    private
    
                     # right    up     down     left
    HORIZONTAL_DIRS = [[1,0], [0,1], [0,-1], [-1,0]]
                  # rt-up    lt-dw    lt-up   rt-dw
    DIAGONAL_DIRS = [[1,1], [-1,-1], [-1,1], [1,-1]]

    def move_dirs #overwritten by subclass

    end
    # def enemey
    #     pos,color != current color
    # end
    def grow_unblocked_moves_in_dir(dx,dy)
        valid_moves = []
        x, y = self.pos
        next_pos = [(dx + x), (dy + y)]
        while valid_pos?(next_pos) 
            if enemy(next_pos)
                valid_moves << next_pos
                break
            elsif !enemy(next_pos) && self[next_pos] != sentinel
                break
            else            
                dx += dx
                dy += dy
            end
        end
        valid_moves
    end
end