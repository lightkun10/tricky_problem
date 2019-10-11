def caesar_cipher(str, num)
  new_str = ""
  alphabet = "abcdefghijklmnopqrstuvwxyz"

  # iterate through each string
  str.each_char do |char|
    # get index of all the char
    old_index = alphabet.index(char)
    new_index = old_index + num
    new_char = alphabet[new_index % 26]
    new_str += new_char
  end

  return new_str
end

puts caesar_cipher("apple", 1)

puts caesar_cipher("bootcamp", 2)

puts caesar_cipher("zebra", 4)
puts caesar_cipher("xyz", 4)