require './lib/board'

class Player

    attr_reader :player_name, :board

    def initialize(name, board)
        @player_name = name
        @board = board
    end

    def has_lost?
        if board.cells {|cell| @ship.sunk?}
            true
        else
            false
        end
    end
end