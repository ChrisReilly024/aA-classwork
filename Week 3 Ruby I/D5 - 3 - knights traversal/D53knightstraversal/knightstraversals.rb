class KnightPathFinder
    MOVES = [
        [-2, -1],
        [-2,  1],
        [-1, -2],
        [-1,  2],
        [ 1, -2],
        [ 1,  2],
        [ 2, -1],
        [ 2,  1]
      ]

    def self.valid_moves(pos)
        valids = [] #valid moves go here
        x,y = pos #our current posistion
        # will need to loop through move list
        # add those to current and see if it falls within board
        # if so, new pos goes into valid moves
        MOVES.each do |px, py|
            new_pos = []
            if px + x > 
        end
    end

    attr_reader :start, :board
    def initialize(start)
        @board = Array.new(8) {Array.new(8,'-')}
        @start = @board[start]
    end

    def build_move_tree(@start)

    end
end


