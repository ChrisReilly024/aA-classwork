require_relative 'piece'

class Pawn < Piece
    def initialize
        super(color, board, position)
    end

    def symbol
    end

    def move_dirs

    end

    private

    def at_start_row?
    end

    def forward_dir
        #return 1 || -1
    end

    def forward_steps

    end

    def side_attacks

    end

end