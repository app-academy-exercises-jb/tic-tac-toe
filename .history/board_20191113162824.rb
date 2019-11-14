class Board
    attr_reader winner

    def initialize
        @grid = Array.new(3) { Array.new(3) }
    end

    def place_mark(location, mark)
        valid_location?(location)

        if empty?(location)
            @grid[location[0]][location[1]] = mark
        else
            raise "Position is already set"
        end
    end

    def empty?(location)
        !@grid[location[0]][location[1]]
    end

    def over?
        forward_slash = [[@grid[0, 0], @grid[1, 1], @grid[2, 2]]]
        back_slash = [[@grid[0, 2], @grid[1, 1], @grid[2, 0]]]
        if (@grid.any? { |r| r.uniq.length == 1 && @winner = r[0] } || 
            @grid.transpose.any? { |r| r.uniq.length == 1 && @winner = r[0] } ||
            forward_slash.any? { |r| r.uniq.length == 1 && @winner = r[0] } ||
            back_slash.any? { |r| r.uniq.length == 1 && @winner = r[0] })
            true
        else
            false
        end
    end

    def valid_location?(location)
        unless location.kind_of?(Array) && location[0].kind_of?(Integer) && location[1].kind_of?(Integer)
            raise "Argument must be a numeric tuple"
        end
        true
    end
end