def partition(arr,num)
    left = arr.select {|n| n < num}
    right = arr.select {|n| n >= num}
    [left,right]
end

def merge(hash1,hash2)
    hash1.merge(hash2)
end


def censor(str, curse)
    str.split(' ').map {|word| curse.include?(word) ? word.gsub(/[aeiou]/, '*') : word}.join(' ')
end