# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    new_str = ''
    count = 1
    str.chars.inject do |char, next_char|
        if char == next_char
            count += 1 
            char = next_char
        else
        new_str += count > 1 ? "#{count.to_s}#{char}" : char
        count = 1
        end
    end
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
