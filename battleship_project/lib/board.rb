class Board
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def self.print_grid(grid) # => [:S, :N],[:X, :S]
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def [](position)
    # separate row and column for each element in the "position" Array
        row, column = position
    # assign the row and column to the grid indexing
        @grid[row][column]
    end

    def []=(position, value)
    # position is always row and column
    # separate row and column for each element in the "position" Array
        row, column = position
    # assign the row and column to the grid indexing
        @grid[row][column] = value
    end

    def num_ships # default grid is :N
        # @grid.flatten.each do |ele|
        #     count += 1 if ele == :S
        # end

        count = 0
        @grid.each do |row|
            row.each do |ele|
                count += 1 if ele == :S
            end
        end

        count
    end

    def attack(position) # position=>[5, 2]
        if self[position] == :S
            self[position] = :H
            puts "You sunk my battleship!"
            return true # if succeed
        else
            self[position] = :X
            return false # if failed
        end
    end

    def place_random_ships # default value of grid is :N
        get_25_percent = @size * 0.25 # 25% of total size

        while num_ships < get_25_percent
            rand_row = rand(0...@grid.length)
            rand_col = rand(0...@grid.length)

            @grid[rand_row][rand_col] = :S
        end
    end

    def hidden_ships_grid
        # map return a new array
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    ele = :N
                else
                    ele
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end


end