def hipsterfy(word)
    vowels = 'aeiou'
    i = word.length - 1
    while i > 0
        char = word[i]
        if vowels.include?(char)
            return word[0...i] + word[i+1..-1]
        end
        i -= 1
    end
    word
end

def vowel_counts(str)
    count = Hash.new(0)
    vowels = 'aeiou'
    str.each_char do |char|
        count[char.downcase] += 1 if vowels.include?(char.downcase)
    end
    count
end