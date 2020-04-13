class MaxIntSet
  attr_reader :max
  def initialize(max)
    @max = max
    @store = Array.new(max + 1, false)
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true
    else 
      raise "Out of bounds"
    end
  end

  def remove(num)
    if validate!(num)
      @store[num] = false
    else
      raise "number false"
    end
  end

  def include?(num)
    is_valid?(num) && validate!(num)
  end

  private

  def is_valid?(num)
    (0..max).include?(num)
  end
  
  def validate!(num)
    @store[num] == true
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end
  
  def insert(num)
    index = num % num_buckets
    store[index] << num 
  end
  
  def remove(num)
    index = num % num_buckets
    store[index].delete(num)
  end
  
  def include?(num)
    index = num % num_buckets
    store[index].include?(num)
  end

  private
  
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets_at_start = @store.length
    @count = 0
  end

  def insert(num)
    unless include?(num)
    index = num % num_buckets
    store[index] << num 
    @count += 1
      resize! if @count == num_buckets
    else
      raise "not included!"
    end 

  end

  def remove(num)
    if include?(num)
    index = num % num_buckets
    @store[index].delete(num)
    @count -= 1
    else
      raise "not included!"
    end 
  end

  def include?(num)
    index = num % num_buckets
    @store[index].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @old_ele = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }

    @old_ele.each do |num|
      @store << num % store.length
    end
  end
end
