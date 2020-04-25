class HashSet
  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if include?(key)
      false
    else
    index = key.hash % @store.length
    @store[index] << key
    @count += 1
    resize! if count == store.length
    true
    end
  end
  
  def include?(key)
    index = key.hash % @store.length
    @store[index].include?(key)
  end

  def remove(key)
    if include?(key)
      index = key.hash % @store.length
      @store[index].delete(key)
      @count -= 1
      true
    else
      false
    end
  end

  private

  def [](num)
    index = num.hash % @store.length
    self.store[index]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_ele = @store.flatten
    @store = Array.new(@store.length * 2) { Array.new }

    old_ele.each do |num|
      @store[num % @store.length] << num
    end
    
  end
end
