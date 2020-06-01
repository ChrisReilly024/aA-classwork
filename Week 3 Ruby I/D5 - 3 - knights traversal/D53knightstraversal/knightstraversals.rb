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
            new_pos[0] = px + x if px + x < 7 && px + x >= 0 
            new_pos[1] = py + y if py + y < 7 && py + y >= 0 
            valids << new_pos if new_pos.size > 1 && !valids.include?(nil)
            
            
        end
        valids.uniq.select {|pairs| !pairs.include?(nil)}
    end
    pp valid_moves([1,2])
    attr_reader :start, :board
    def initialize(start)
        @board = Array.new(8) {Array.new(8,'-')}
        @start = start
        @considered = [@start]
    end

    # def build_move_tree(@start)

    # end
end


