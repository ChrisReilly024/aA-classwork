class Tower
    attr_reader :board

    def initialize
        @board = Array.new(3) {Array.new}
    end

    def place_disks
        board[0] = [1,2,3]
        board 
    end

    def get_turn
        input = gets.chomp.to_i
    end

    def move(n1, n2)
        el = board[n1].shift

        if !board[n2].empty? && el > board[n2].first
            raise RuntimeError
        else  
            board[n2].unshift(el)
        end
        board
    end

    def won?
        board.each_with_index do |t, i|
            return true if t == [1,2,3] && i != 0
        end
        false
    end
end

