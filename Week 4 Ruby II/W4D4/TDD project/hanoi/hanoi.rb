class InitError < StandardError; end

class Hanoi
    attr_reader :stones
    attr_accessor :stacks
    def initialize(stacks, stones)
        raise InitError.new('stacks and stones must be an integer') if !stacks.is_a?(Integer) || !stones.is_a?(Integer)
        @stacks = stacks
        @stones = stones
        @board = Array.new(stacks) {Array.new}
        set_game
    end
    
    def prompt
        [
            'Invalid input, try again', #0
            'Invalid move, stack error', #1
            "Move piece from which stack to which stack? input format should be #,# ex. (1,2)", #2
            "Winner!!", #3
            "Do you want to play again?, y / n", #4
            "Goodbye!", #5
            "Invalid response, y / n ?", #6
            "Start stack is empty" #7        
        ]
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
        elsif input[0].empty?
            prompt[7]
            return false
        else
            return true
        end
    end

    def move_piece(move)
        @board[move[1]].unshift(@board[move[0]].shift)
    end

    def won?
        final = []
        i = 0
        until final.length == stones
            final << i + 1
            i += 1
        end
        p final
        if @board[2] == final 
            puts prompt[3]
            return true
        else
            return false
        end
    end

    def print
        system('clear')
        p @board
    end

    def play_again?
        puts prompt[4]
        input = gets.input.downcase
        if input != 'y' || input != 'n'
            prompt[6]
            play_again?
        end
        if input == 'y'
            play
            return true
        else
            prompt[5]
            return false
        end
    end    

end



a = Hanoi.new(3,3)

a.make_move(0,1)
