# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "prime"

def largest_prime_factor(num)
  num.downto(2).each { |n| return n if Prime.prime?(n) && num % n == 0 }
end

def unique_chars?(str)
  str == str.split("").uniq.join
end

def dupe_indices(arr)
  hash = Hash.new {|hash,k| hash[k] = []}
  arr.each.with_index { |ele, i| hash[ele] << i }
  hash.select { |k,v| hash[k].length > 1 }
end

def ana_array(arr_1, arr_2)
  arr_1 - arr_2 == [] && arr_2 - arr_1 == []
end