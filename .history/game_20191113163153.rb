#init is called on two player instances, which sets their mark (:X | :O)
#switch_players!
#play_turn, handles the logic for a single turn
#play, which calls the #play_turn every move in a loop until 
#over?
require_relative "board.rb"
require_relative "player.rb"

class Game
    def initialize(player_1, player_2)
        unless player_1.kind_of?(Player) && player_2.kind_of?(Player)
            raise "We only play with players"
        end

        @player_1, @player_2 = player_1, player_2
        @current_player = @player_1
        @board = Board.new

        self.play
    end

    def play
        until self.over?
            self.play_turn
            self.switch_player!
        end
        p board.winner + " is the winner!"
    end

    def play_turn
        @board.place_mark(@current_player.get_move, @current_player.mark)
    end

    def over?
        @board.over
    end

    def switch_player!
        @current_player = @current_player == @player_1 ? @player_2 : @player_1
    end
end