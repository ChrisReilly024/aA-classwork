class InitError < StandardError; end

class Hanoi
    def initialize(stacks, stones)
        raise InitError.new('stacks and stones must be an integer') if !stacks.is_a?(Integer) || !stones.is_a?(Integer)
        @stacks = stacks
        @stones = stones
        @board = Array.new(stacks) {Array.new}
        set_game
    end
    
    def prompt
        ['Invalid input, try again', 'Invalid move, stack error', "Move piece from which stack to which stack? input format should be #,# ex. (1,2)"]
    end

    def set_game        
        for i in 0...stones do
            @board[0] << i + 1
            @board[i] = [] if !@board[i].nil? && i != 0
        end
    end

    def get_move
        puts prompt[2]
        input = gets.chomp.split(',').map(&:i)
        valid_input?(input)
        input
    end

    def valid_input?(input)
        if (input[0] < 0 || input[0] > stacks - 1) || (input[1] < 0 || input[1] > stacks - 1)
            puts prompt[0]
            get_move
        else
            return true
        end
    end

    def valid_move?(input)
        if @board[input[0]].first > @board[input[1]]
            puts prompt[1]
            return false
        else
            return true
        end
    end
end

