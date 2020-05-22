class Item
    # attr_reader :title, :deadline, :description
    attr_accessor :title, :deadline, :description
    def self.valid_date?(date)
        return false if date[0..3].to_i < 1000
        return false if date[5..6].to_i > 12
        return false if date[8..9].to_i > 31
        true
    end
     
    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
    end
end

# def up(list,idx, spots=1)

#     while spots != 0
#         return 'Item at top of list' if idx == 0
#         swap(idx, idx-1)

#     end
# end 


# def swap(list, idx1, idx2)
#     if !valid_index?(idx1) || !valid_index?(idx2)
#         raise "Invalid index"
#     else
#         @items[idx1],@items[idx2] = @items[idx2], @items[idx1]
#         return true
#     end
# end

#    list = ['deadline="2019-10-25', 'Get American and Feta for good measure.',"cheese"]
# up(list, 2, spots)
