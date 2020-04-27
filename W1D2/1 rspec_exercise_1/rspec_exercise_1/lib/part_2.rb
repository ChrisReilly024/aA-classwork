def hipsterfy(word)
    word.reverse.sub(/[aeiou]/, '').reverse
end

def vowel_counts(str)
    hash = Hash.new(0)
    str.downcase.each_char {|char| hash[char] += 1 if char.match(/[aeiou]/)}
    hash
end

def caesar_cipher(str,n)
    alpha = ('a'..'z').to_a
    hash = Hash[alpha.zip(alpha.rotate(n))]
    str.gsub(/[a-z]/, hash)
end