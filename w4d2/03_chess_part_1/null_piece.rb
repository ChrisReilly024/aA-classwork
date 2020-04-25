require 'singleton'
require_relative 'piece'


class NullPiece < Piece
    attr_reader :color, :symbol
    include Singleton

    def initialize
        # super(color, board, position)
       @symbol = :N
    end


end