def all_words_capitalized?(str)
    str.all? {|word| word == word.capitalize }
end

def no_valid_url?(ar)
    ar.none? {|url| url.end_with?('.com','.net','.net','.io','.org')}
end

def any_passing_students?(ar)
    ar.any? {|student| (student[:grades].sum / student[:grades].length) > 75}
end

