def select_even_nums(array)
    array.select(&:even?)
end

def reject_puppies(array)
    array.reject {|puppy| puppy['age'] < 3}
end


def count_positive_subarrays(array)
    array.count {|subs| subs.sum > 0}
end

def aba_translate(word)
    vowels = 'aeiou'
    str = ''
    word.each_char do |char| 
        if vowels.include?(char)
            str += char + 'b' + char 
        else
            str += char
        end
    end
    str
end

def aba_array(array)
    array.map {|word| aba_translate(word)}
end

