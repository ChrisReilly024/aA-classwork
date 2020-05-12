def average(num_1,num_2)
    (num_1 + num_2) / 2.0
end

def average_array(array)
    array.sum / array.length.to_r
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + '!'
end

def alternating_case(str)
    new_str = str.split.map.with_index do |word,i| 
        i.even? ? word.upcase : word.downcase
    end
    new_str.join(' ')
    # new_str = str.split.map.with_index {|word,i|i.even? ? word.upcase : word.downcase}.join(' ')
end

