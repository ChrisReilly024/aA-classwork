require 'prime'
def is_prime?(num)
    Prime.prime?(num)
end

def nth_prime(num)
   (Prime.first num)[-1]
end

def prime_range(min,max)
    (min..max).to_a.select { |num| is_prime?(num) }
end
