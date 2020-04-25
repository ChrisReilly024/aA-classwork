require 'byebug'
class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    total = 0
    self.each_with_index do |ele, i|
        total += ele * i
    end
    total
  end
end

class String
  def hash
    alpha = ('a'..'z').to_a + ("A".."Z").to_a
    sum = 0
    self.each_char.with_index do |ele,i|
      sum += alpha.index(ele) * i
    end
    sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    alpha = ('a'..'z').to_a + ("A".."Z").to_a 
    sum = 0

    self.each do | k, v |
      # p alpha.index(v)
      # p alpha.index(k) * 100
      # first_part = alpha.index(k.to_s) * 371
      # second_part = alpha.index(v.to_s) * 555

      first_part = 0
      second_part = 0

      if k.instance_of?(Integer)
        first_part = k * 8888
      else 
        first_part = alpha.index(k.to_s) * 371
      end

      if v.instance_of?(Integer)
        second_part = v * 7545654
      else
        second_part = alpha.index(v.to_s) * 555
      end

      sum += first_part + second_part
    end
    # p sum
    sum
  end
end
