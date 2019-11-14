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
        begin 
            return [rand(3), rand(3)]
        rescue RuntimeError
            self.get_move
        end
    end
end

class Human_Player < Player
    def get_move
        
        self.display
        
        p "Please input a location, like this: 0, 2"
        location = gets.chomp.split(", ").map { |i| i.to_i }


        begin
            Board.valid_location?(location)
            @board.empty?(location)
        rescue RuntimeError => e
            puts e.message
            location = self.get_move
        end
        
        
        return location
    end

    def display
        grid = @board.grid.map { |ele| }

        puts "#{grid[0][0] || " "}|#{grid[0][1]}|#{grid[0][2]}\n"\
         "---------\n"\
         "#{grid[1][0]}|#{grid[1][1]}|#{grid[1][2]}\n"\
         "---------\n"\
         "#{grid[2][0]}|#{grid[2][1]}|#{grid[2][2]}"\

        
    end
end