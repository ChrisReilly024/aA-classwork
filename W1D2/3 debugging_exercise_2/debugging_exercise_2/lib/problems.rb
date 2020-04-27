# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require 'prime'
def largest_prime_factor(num)
    Prime.prime_division(num).flatten.max
end

def unique_chars?(str)
    chars = []
    str.each_char {|char| return false if chars.include?(char); chars << char}
    true
end

def dupe_indices(array)
    hash = Hash.new {|hash,k| hash[k] = [] }
    array.each_with_index {|ele,i| hash[ele] << i  }
    hash.select {|k,v| hash[k].length > 1 }
end

def ana_array(ar1,ar2)
    (ar1 - ar2).empty? && (ar2 - ar1).empty?
end
p ana_array(["i","c","e","m","a","n"], ["c","i","n","e","m","a"])
p ana_array(["cat", "dog", "cat"], ["dog", "cat", "mouse"])
p ana_array([1,2,3], [1,3,2])
p ana_array([1,7,3], [1,2,3])