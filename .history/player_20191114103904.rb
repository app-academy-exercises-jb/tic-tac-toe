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
            if can_win?
                self.win
            else
                move = [rand(3), rand(3)]
                until @board.empty?(move)
                    puts move
                    move = [rand(3), rand(3)]
                end
                
                return move 
            end
        rescue RuntimeError
            self.get_move
        end
    end

    def can_win?
        @board.over? { |r| r.count(self.mark) == 2 && r.include?(nil) }
    end

    def win
        winning_move = []

        forward_slash = [[@board.grid[0][0], @board.grid[1][1], @board.grid[2][2]]]
        back_slash = [[@board.grid[0][2], @board.grid[1][1], @board.grid[2][0]]]
        sets = [@board.grid, @board.grid.transpose, forward_slash, back_slash]

        sets.each_with_index { |set, i| 
            set.each_with_index { |row, idx| 
                if row.count(self.mark) == 2 && row.include?(nil)
                    @winning_move = [i, idx, row.find_index(nil)]
                end
            }
        }
        debugger
        case winning_move[0]
        when 0
            winning_move = [winning_move[1], winning_move[2]]
        when 1
            winning_move = [winning_move[2], winning_move[1]]
        when 2
        when 3

        winning_move
    end
end

class Human_Player < Player
    def get_move
        
        @board.print
        
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

end