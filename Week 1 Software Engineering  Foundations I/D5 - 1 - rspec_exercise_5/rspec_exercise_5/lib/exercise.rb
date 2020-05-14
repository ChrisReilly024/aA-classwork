def zip(*arr)
    arr.transpose
end

def prizz_proc(arr, prc1, prc2)
    arr.select do |ele|
        if prc1.call(ele) ^ prc2.call(ele)
            ele 
        end
    end
end

def zany_zip(*arr)
    long = arr.sort_by(&:length)[-1].length
    result = Array.new(long) {Array.new(arr.length)}
    arr.each_with_index do |sub, idx1|
        sub.each_with_index do |ele, idx2|
            result[idx2][idx1] = ele
        end
    end
    result
end 

    
def maximum(arr, &prc)
     
    arr.inject do |max, ele|
        acc = prc.call(ele) >= prc.call(max) ? ele : max 
    end

end

def my_group_by(arr, &prc)
    hash = Hash.new { |h,k| h[k] = [] }
    arr.each do |ele|
        hash[prc.call(ele)] << ele
    end
    hash
end

def max_tie_breaker(arr, prc1, &prc2)
    max = [] 
    return nil if arr.empty?
    arr.each do |ele|
        if prc2.call(ele) > prc2.call(max)
            max = ele  
        else
            if prc2.call(ele) == prc2.call(max)
                max == ele if prc1.call(ele) > prc1.call(max)
            end
        end
    end
        max 
end

def vowel_count(word)
    count = 0
    vowels ='aeiou'
    word.each_char {|char| count += 1 if vowels.include?(char) }
    count
end

def remove(word)
    first_vowel = 0
    last_vowel = 0
    vowels = 'aeiou'
    word.each_char.with_index do |char,i|
        if vowels.include?(char)
            first_vowel = i 
            break
        end
    end
    word.reverse.each_char.with_index do |char,i|
        if vowels.include?(char)
            last_vowel = i 
            break
        end
    end
    last_vowel = -last_vowel - 1 
    word[first_vowel..last_vowel]
end

def silly_syllables(str)
    array = []
    str.split.each do |word|
        if vowel_count(word) < 2
            array << word 
        else
            array << remove(word)
        end
    end
    array.join(' ')
end


