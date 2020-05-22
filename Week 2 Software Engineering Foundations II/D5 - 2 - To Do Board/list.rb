require_relative 'item'
class List
    LINE_WIDTH = 42
    INDEX_COL_WIDTH = 5
    ITEM_COL_WIDTH = 20
    DEADLINE_COL_WIDTH = 10

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
        puts "-" * LINE_WIDTH
        puts " " * 16 + self.label.upcase
        puts "-" * LINE_WIDTH
        puts "#{'Index'.ljust(INDEX_COL_WIDTH)} | #{'Item'.ljust(ITEM_COL_WIDTH)} | #{'Deadline'.ljust(DEADLINE_COL_WIDTH)}"
        puts "-" * LINE_WIDTH
        @items.each_with_index do |item,i| 
            p "#{i.to_s.ljust(INDEX_COL_WIDTH)} | #{item.title.ljust(ITEM_COL_WIDTH)} | #{item.deadline.ljust(DEADLINE_COL_WIDTH)}"
        end       
        puts "-" * LINE_WIDTH
    end

    def print_full_item(idx)
        if valid_index?(idx)
            puts "-------------------------"
            puts "#{@items[idx].title}        #{@items[idx].deadline}"
            puts "#{@items[idx].description}"
            puts "-------------------------"
        end
    end

    def print_priority(idx)
        if valid_index?(idx)
            puts "-------------------------"
            puts "#{@items[0].title}        #{@items[0].deadline}"
            puts "#{@items[0].description}"
            puts "-------------------------"
        end
    end

    def up(idx, spots=1)
        return "Invalid index" if !valid_index?(idx)
        while spots != 0
            return "Item at top of the list" if idx == 0
            swap(idx,idx-1)
            spots -= 1
            idx -= 1
        end
        "successful swap"
    end 
    def down(idx, spots=1)
        return "Invalid index" if !valid_index?(idx)
        while spots != 0
            return "Item at bottom of the list" if idx == size - 1
            swap(idx,idx + 1)
            spots -= 1
            idx += 1
        end
        "successful swap"
    end 

end

