class List
    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title,deadline,description='')
        
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        idx >= 0 && idx < self.size
    end

    def swap(idx1, idx2)
        return "Invalid index" if !valid_index?(idx1) || !valid_index?(idx2)
        idx1, idx2 = idx2, idx1
    end

    def [](idx)
        valid_index?(idx) ? @items[idx] : "Invalid index"
    end

    def priority
        @items.first
    end

end