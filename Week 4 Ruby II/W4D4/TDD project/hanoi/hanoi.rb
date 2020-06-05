class InitError < StandardError; end

class Hanoi
    attr_reader :stones
    attr_accessor :stacks
    def initialize(stacks, stones)
    # def initialize(stacks, stones)
        # raise InitError.new('stacks and stones must be an integer') if !stacks.is_a?(Integer) || !stones.is_a?(Integer)
        # @stacks = stacks
        # @stones = stones
        # @board = Array.new(stacks) {Array.new}
        # set_game
        @board = Array.new(3) {Array.new}
    end
    
    def response
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


end


=begin
    print board
    get input
    check input
    accept if valid repeat if not

    plug input into move
    check if move valid
    make move
rescue => exception
    
end


a = Hanoi.new(3,3)

# a.print
# p a.valid_move?([0,1])
# p a.valid_input?([0,3])
# a.move_piece([0,1])
# a.move_piece([1,2])
# a.move_piece([0,2])
# a.print
