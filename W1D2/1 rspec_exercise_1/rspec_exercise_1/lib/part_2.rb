def hipsterfy(word)
    word.reverse.sub(/[aeiou]/, '').reverse
end