def partition(arr, num)
    less = []
    greater = []

    arr.each {|ele| ele >= num ? greater << ele : less << ele }

    [less, greater]
end

def merge(hash_1, hash_2)
    hash_1.merge(hash_2)    
end

def swapper(word)
    word.gsub(/[aeiouAEIOU]/,"*")
end

def censor(str, arr)
    str.split.map {|word| arr.include?(word.downcase) ? swapper(word) : word }.join(' ')
end

def power_of_two?(num)
    return true if num == 1
    (2...num).each do |n|
        return true if 2 ** n == num
        return false if 2 ** n > num            
    end
end
