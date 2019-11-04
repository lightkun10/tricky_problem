#######################
# Proc Problems
#######################

## String#select

# Extend the string class by defining a String#select method 
# that accepts a block. The method should return a new string 
# containing characters of the original string that return true 
# when passed into the block. If no block is passed, then return 
# the empty string. Do not use the built-in Array#select in your solution.

class String

    def select(&prc)
        return "" if prc.nil?

        new_str = ""

        self.each_char do |char|
            new_str += char if prc.call(char)
        end
        new_str
    end

## String#map!
# Extend the string class by defining a String#map! method 
# that accepts a block. The method should modify the existing string 
# by replacing every character with the result of calling the block, 
# passing in the original character and it's index. 
# Do not use the built-in Array#map or Array#map! in your solution.

    def map!(&prc)
        self.each_char.with_index do |char, i|
            self[i] = prc.call(char, i)
        end
        self
    end

end

"app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
"HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
"HELLOworld".select          # => ""


word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"