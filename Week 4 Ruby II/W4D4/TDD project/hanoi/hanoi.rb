class InitError < StandardError; end

class Hanoi
    attr_reader :stones
    attr_accessor :stacks
    def initialize
        @board = [ [1,2,3], [], [] ]
        # def initialize(stacks, stones)
        # raise InitError.new('stacks and stones must be an integer') if !stacks.is_a?(Integer) || !stones.is_a?(Integer)
        # @stacks = stacks
        # @stones = stones
        # @board = Array.new(stacks) {Array.new}
        # set_game
    end
    
    def response
        [
            'Invalid input, one or both stacks do not exist, try again', #0
            "Invalid input, You need to move a piece from one stack to another", #1
            'Invalid move, stack error, cannot move piece on top of a smaller piece', #2
            "Move piece from which stack to which stack? input format should be #,# ex. 1,2", #3
            "Winner!!", #4
            "Do you want to play again?, y / n", #5
            "Goodbye!", #6
            "Invalid response, y / n ?", #7
            "Start stack is empty" #8        
        ]
    end

    # def set_game        
    #     for i in 0...stones do
    #         @board[0] << i + 1
    #         @board[i] = [] if !@board[i].nil? && i != 0
    #     end
    # end

    def print
        p @board
    end

    def get_move
        puts response[3]
        move = gets.chomp.split(',').map(&:to_i)
        p move
        get_move if !valid_input?(move)
        move
    end

    def valid_input?(input)
        if (input[0] < 0 || input[0] > 2) || (input[1] < 0 || input[1] > 2)
            puts response[0]
            return false
        elsif input[0] == input[1]
            puts response[1]
            return false
        else
            return true
        end
    end
end


=begin
    
    get input
    check input
    accept if valid repeat if not

    plug input into move
    check if move valid
    make move

    # p a.valid_move?([0,1])
    # a.move_piece([0,1])
    # a.print
=end
    
a = Hanoi.new
a.get_move
# p a.valid_input?([1,1])
a.print
    
