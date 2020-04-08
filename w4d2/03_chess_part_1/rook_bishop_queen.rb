require_relative 'piece'
require_relative "slide_mod"

class Queen < Piece
    include Slideable
    
    def initialize
        super(color, board, position)
    end
    
    def symbol
    end
    
    protected
    
    def move_dirs
        HORIZONTAL_DIRS + DIAGONAL_DIRS
    end
end

class Bishop < Piece
    include Slideable
    
    
    def initialize
        super(color, board, position)
    end
    
    def symbol
    end
    
    protected
    
    def move_dirs
        DIAGONAL_DIRS
    end
end

class Rook < Piece
    include Slideable
    

    def initialize
        super(color, board, position)
    end
    
    def symbol
    end
    
    protected
    .
    def move_dirs
        HORIZONTAL_DIRS 
    end
end