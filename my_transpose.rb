class Array
    def my_transpose
        new_array = []

        # iterate through each element of the array
        # iterate through the row
        (0...self.length).each do |row|
            # for every row, create an empty new row
            new_row = []

            # iterate through the column
            (0...self.length).each do |column|
                new_row << self[column][row]
            end

            new_array << new_row
        end

        new_array
    end
end