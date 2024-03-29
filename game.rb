require_relative "board.rb"
require_relative "player.rb"
require "byebug"

class Game
    def initialize(player_1, player_2)
        unless player_1.kind_of?(Player) && player_2.kind_of?(Player)
            raise "We only play with players"
        end

        if player_1.mark == player_2.mark
            raise "Two players cannot play with the same mark"
        end

        @player_1, @player_2 = player_1, player_2
        @current_player = @player_1
        @board = Board.new

        @player_1.get_board(@board)
        @player_2.get_board(@board)

        self.play
    end

    def play
        until self.over?
            self.play_turn
            self.switch_player!
        end
        @board.winner ? (p @board.winner.to_s + " is the winner!") : (p "It's a tie!")
        @board.print
    end

    def play_turn
        @board.place_mark(@current_player.get_move, @current_player.mark)
    end

    def over?
        @board.over? || !@board.grid.flatten.include?(nil)
    end

    def switch_player!
        @current_player = @current_player == @player_1 ? @player_2 : @player_1
    end
end