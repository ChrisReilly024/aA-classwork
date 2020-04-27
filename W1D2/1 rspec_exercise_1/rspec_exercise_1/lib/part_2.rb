# def hipsterfy(word)
#     word.reverse.sub(/[aeiou]/, '').reverse
# end

def vowel_counts(str)
    hash = Hash.new(0)
    str.downcase.each_char {|char| hash[char] += 1 if char.match(/[aeiou]/)}
    hash
end

vowel_counts("williamsburg bridge")