def average(n1,n2)
    (n1+n2) / 2.0
end

def average_array(ar)
    ar.sum / ar.length.to_r
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + '!'
end

def alternating_case(str)
    str.split.map.with_index {|word, i| i % 2 == 0 ? word.upcase : word.downcase}.join(' ')
end

