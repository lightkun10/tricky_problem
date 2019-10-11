def same_char_collapse(str)
  collapsible = true

  while collapsible
    collapsible = false

    chars = str.split("")
    # iterate through the string
    chars.each.with_index do |char, i|
      # if one char is identical to the next of it
      if chars[i] == chars[i + 1]
        chars[i] = ""
        chars[i + 1] = ""
        collapsible = true
        break
      end
    end

    str = chars.join("")
  end

  return str
end

puts same_char_collapse("zzzxaaxy")   #=> "zy"
# because zzzxaaxy -> zxaaxy -> zxxy -> zy

puts same_char_collapse("uqrssrqvtt") #=> "uv"
# because uqrssrqvtt -> uqrrqvtt -> uqqvtt -> uvtt -> uv