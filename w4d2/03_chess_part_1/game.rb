require_relative 'display'
require_relative 'player'


class Game

    def initialize
        @board = board
        @display = display
        @player_1 = player_1
        @player_2 = player_2
        @current_player = player_1
    end

    def play 

    end

    private

    def notify_players

    end

    def swap_turn!
        @current_player = current_player == player_1 ? player_2 : player_1
    end

end