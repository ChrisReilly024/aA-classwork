require_relative 'item'
class List

    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title,deadline,description='')
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        else
        raise "Invalid deadline" 
        return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        idx >= 0 && idx < self.size
    end

    def swap(idx1, idx2)
        if !valid_index?(idx1) || !valid_index?(idx2)
            raise "Invalid index"
        else
            @items[idx1],@items[idx2] = @items[idx2], @items[idx1]
            return true
        end
    end

    def [](idx)
        valid_index?(idx) ? @items[idx] : "Invalid index"
    end

    def priority
        @items.first
    end
    
    def print
        p "-------------------------------"
        p "|          #{@label.upcase}          |"
        p "-------------------------------"
        p "|  Index    |      Item     | Deadline| "
        p "-------------------------------"
        @items.each_with_index do |item,i| 
            p "|#{i.to_s} | #{item.title} | #{item.deadline}|"
        end       
    end
end