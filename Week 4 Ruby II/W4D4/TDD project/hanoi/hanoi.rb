class Hanoi
    def initialize(stacks, stones)
        raise InitError.new('stacks and stones must be an integer') if !stacks.is_a?(Integer) || !stones.is_a?(Integer)
        @stacks = stacks
        @stones = stones
        @board = Array.new(stacks) {Array.new}
        set_game
    end
    
    def set_game        
        for i in 0...stones do
            @board[0] << i + 1
            @board[i] = [] if !@board[i].nil? && i != 0
        end
    end
    
end
