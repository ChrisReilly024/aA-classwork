def select_even_nums(array)
    array.select {|num| num.even?}
end

def reject_puppies(ar)
    ar.reject {|dog| dog['age'] < 3}
end

def count_positive_subarrays(ar)
    ar.count {|sub| sub.sum > 0}
end
p count_positive_subarrays([[-2, 5], [1, -9, 1], [4, 7]])

def aba_translate(word)
    word.chars.map {|char| char.match(/[aeiou]/) ? char + 'b' + char : char}.join
end

def aba_array(ar)
    ar.map {|word| aba_translate(word)}
end