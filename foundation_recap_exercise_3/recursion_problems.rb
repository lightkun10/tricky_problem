def vowel_rotate(str)
# Make a copy of original string
    new_str = str[0..-1]

# obtain the indices of the vowels in the string 
    vowels = "aeiou"
    vowel_indices = (0...str.length).select { |i| vowels.include?(str[i]) }

# Rotate the positions of the array
    new_vowel_indices = vowel_indices.rotate(-1) # REMEMBER THIS

# Iterate through the ORIGINAL vowel indices 
    vowel_indices.each_with_index do |vowel_idx, i|
        # vowel_idx = position of vowel in the ORIGINAL string
        # i = actual index of that element, within the vowel indices

#  Reassign some data within the copy string
        new_vowel = str[new_vowel_indices[i]]
        new_str[vowel_idx] = new_vowel
    end

    new_str
end

vowel_rotate('computer')  