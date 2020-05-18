class GuessingGame
    attr_reader :check_num, :num_attempts

    def initialize(min,max)
        @min = min 
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        if num == @secret_num
            @game_over = true
            p "you win"
        elsif num > @secret_num
            p 'too big'
        elsif num < @secret_num
            p 'too small'
        end
    end

    def ask_user
        puts "Enter a number: "
        input = gets.chomp.to_i
        self.check_num(input)
    end
    

end
# 1) GuessingGame #check_num should set @game_over to true if the num is equal to @secret_num
# Failure/Error: expect(guessing_game.game_over?).to eq(true)
  
#   expected: true
#        got: false
  
#   (compared using ==)
# # ./spec/guessing_game_spec.rb:63:in `block (3 levels) in <top (required)>'

# 2) GuessingGame #check_num when the num is equal to @secret_num should print 'you win'
# Failure/Error: expect { guessing_game.check_num(42) }.to output(/win/).to_stdout
#   expected block to output /win/ to stdout, but output "\"too small\"\n"
#   Diff:
#   @@ -1,2 +1,2 @@
#   -/win/
#   +"too small"