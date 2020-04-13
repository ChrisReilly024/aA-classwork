
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = @next
    @next.prev = @prev
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

# require 'Node'
class LinkedList < Node
  attr_reader :head, :tail
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    empty? ? nil : self.head.next
  end

  def last
    empty? ? nil : self.tail.prev
  end

  def empty?
    # @head.val.nil? || @tail.val.nil?
    self.head.next == self.tail
  end

  def get(key)
    # return nil if 
  end

  def include?(key) 
    # return self if self.key == key
    
  end

  def append(key, val)
    #Ara's
    # return nil if self.empty?
    new_node = Node.new(key,val)
    self.tail.prev.next = new_node
    new_node.prev = self.tail.prev
    new_node.next = self.tail
    self.tail.prev = new_node
    new_node #if !empty?

    #us
    # new_node = Node.new(key,val)
    # @tail.prev.next = new_node
    # new_node.prev = @tail.prev
    # new_node.next = @tail
    # @tail.prev = new_node




    # # dH  dT
    # # new!!
    # # <- new!! ->
    # if empty?
    #   @head = new_node
    #   @tail = new_node
    # elsif @head == @tail
    #   @tail = new_node
    #   @tail.prev = @head
    #   @head.next = new_node
    # else
    # new_header = @tail.prev
    
    # new_node.prev = new_header
    # new_node.next = @tail
    
    # new_header.next = new_node
    # @tail.prev = new_node
    # end
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
