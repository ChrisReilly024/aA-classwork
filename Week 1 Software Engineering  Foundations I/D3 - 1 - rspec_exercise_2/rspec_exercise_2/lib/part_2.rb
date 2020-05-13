def palindrome?(str)
    # DO NOT USE STRING REVERSE || ARRAY REVERSE
    new_str = ""
    i = str.length - 1
    while i >= 0 
      new_str += str[i]
      i -= 1
    end
    str == new_str
end

def substrings(string)
    subs = []
    for i in 0...string.length do 
        for j in 0...string.length do 
            subs << string[i..j] if j >= i
        end
    end
  subs
end

def palindrome_substrings(str)
    substrings(str).select { |sub| sub.length > 1 && palindrome?(sub) }
end
