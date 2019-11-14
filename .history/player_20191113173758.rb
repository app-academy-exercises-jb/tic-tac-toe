#instance variable that represents mark: :X or :O, set on init
#   #display should store the board it is passed as an instance variable
#   #get_move should return a winning position if it is available, otherwise a random one
require_relative "board.rb"
require "byebug"
class Player
    def initialize(mark)
        unless mark == :X || mark == :O
            raise "Mark must either be :X or :O"
        end

        @mark = mark
    end

    def get_board(board)
        @board = board
    end

    def mark
        @mark
    end
end

class Computer_Player < Player
    def get_move
    
    end
end

class Human_Player < Player
    def get_move
        self.print
        
        p "Please input a location, like this: 0, 3"
        location = gets.chomp
        self.get_move unless Board.valid_location?(location)

        self.print
        location
    end

    def print
        debugger
        puts "#{@board[0][0]}|#{@board[0][1]}|#{@board[0][2]}"\
            "---------"\
            "#{@board[1][0]}|#{@board[1][1]}|#{@board[1][2]}"\
            "---------"\
            "#{@board[2][0]}|#{@board[2][1]}|#{@board[2][2]}"
    end
end