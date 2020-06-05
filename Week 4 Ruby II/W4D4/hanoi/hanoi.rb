class InitError < StandardError; end

class Hanoi
    attr_reader :stones
    attr_accessor :stacks
    def initialize
        @board = [ [1,2,3], [], [] ]
        play
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
        "Invalid response", #7
        "Start stack is empty" #8        
        ]
    end

    def print
        p @board
    end

    def get_move
        puts response[3]
        move = gets.chomp.split(',').map(&:to_i)
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

    def move_piece(move)
        if valid_move?(move)
            @board[move[1]].unshift(@board[move[0]].shift)
        end
    end

    def valid_move?(move)
        return true if @board[move[1]].empty?
        if @board[move[0]].first > @board[move[1]].first
            puts response[2]
            get_move
            return false
        else
            return true
        end
    end

    def win?
        if @board[2] == [1,2,3]
            puts response[4]
            return true
        else
            return false
        end
    end
    
    def reset
        puts response[5]
        input = gets.chomp.downcase
        if input != 'y' || input != 'n'
            puts response[7]
            reset
            return false
        elsif input == 'y'
            @board = [ [1,2,3], [], [] ]
            play
            return true
        else
            puts response[6]
            return false
        end
    end
    
    def play
        until win?
            move = get_move
            move_piece(move)
            print
            win?
        end
        # reset
        p 'Game Over'
        return false
    end
end
