class PolyTreeNode
    attr_reader :parent
    attr_accessor :value, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end
end



=begin
n1 = PolyTreeNode.new("root1")
n2 = PolyTreeNode.new("root2")
n3 = PolyTreeNode.new("root3")
n4 = PolyTreeNode.new("root4")
n3.parent = n1
n3.parent = n2
n4.parent = n2

# connect n3 to n1
n3.parent = n1
# connect n3 to n2
n3.parent = n2
n4.parent = n2

# # this should work
 raise "Bad parent=!" unless n3.parent == n2
 raise "Bad parent=!" unless n2.children == [n3]

# # this probably doesn't
# raise "Bad parent=!" unless n1.children == []

=end
