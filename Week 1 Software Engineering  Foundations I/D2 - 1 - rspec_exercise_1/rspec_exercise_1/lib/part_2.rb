def hipsterfy(word)
    vowels = 'aeiou'
    i = word.length - 1
    while i > 0
        char = word[i]
        return word[0...i] + word[i+1..-1] if vowels.include?(char)
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
# str.each_char {|char| count[char.downcase] += 1 if char.downcase.match(/[aeiou]/)}


def caesar_cipher(str,num)
    alpha = ('a'..'z').to_a
    new_str = ''
    str.each_char do |char|
        if alpha.include?(char)
            new_idx = (alpha.index(char) + num) % 26
            new_str += alpha[new_idx]
        else
            new_str += char
        end
    end
    new_str
end


# hash = Hash[alpha.zip(alpha.rotate(num))]
# str.gsub(/\w/) {|char| hash[char] ? hash[char] : char}