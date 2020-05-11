# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.


# range to hit every number up to numbers
# check if num is divisble by both num_1 and num_2
#  %
def coprime?(num_1, num_2)
    (2...num_1).each { |n| return false if num_1 % n == 0 && num_2 % n == 0 } 
    true
end

p coprime?(25, 12) # true
p coprime?(7, 11) # true
p coprime?(30, 9) # false
p coprime?(6, 24) # false
