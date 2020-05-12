def all_words_capitalized?(array)
    array.all? {|word| word.capitalize == word}
end

def no_valid_url?(array)
    url = %w(.com .net .io .or .org)   
    p url
    array.none? do |site|
        url.any? {|url_ending| site.end_with?(url_ending) }
    end
end

def any_passing_students?(array)
    array.any? {|student| student[:grades].sum / student[:grades].length > 75}
end

