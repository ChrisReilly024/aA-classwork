require_relative 'piece'
require "singleton"
class NullPiece < Piece 
    include Singleton
    def initialize
        @symbol = :N 
        @color = :blank 
    end

    def moves
        []
    end

    def symbol #What we print out
        @symbol
    end

    def inspect
        ":N"
    end


    def color #color is how the board will recognize a piece
        @color 
    end

    
end