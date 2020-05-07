class PolyTreeNode
    attr_accessor :parent
    attr_reader :value, :children
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def self.parent=(parent)
        @parent = parent
        children.shift(parent.children)
    end
end