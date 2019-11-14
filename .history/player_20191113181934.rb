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
        @board = board.grid
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
        
        self.display
        
        p "Please input a location, like this: 0, 2"
        location = gets.chomp.split(", ").map { |i| i.to_i }

        begin
            Board.valid_location?(location)
        rescue RuntimeError => e
            puts e.message
            location = self.get_move
        end
        
        
        return location
    end

    def display
        
        print "#{@board[0][0]}|#{@board[0][1]}|#{@board[0][2]}"
        print "---------"
        print "#{@board[1][0]}|#{@board[1][1]}|#{@board[1][2]}"
        print "---------"
        print "#{@board[2][0]}|#{@board[2][1]}|#{@board[2][2]}"

        puts
    end
end