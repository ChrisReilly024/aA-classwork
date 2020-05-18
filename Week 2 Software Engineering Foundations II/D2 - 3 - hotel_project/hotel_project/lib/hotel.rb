require_relative "room"

class Hotel
  def initialize(name, capacity)
    @name = name
    @rooms = {} 
    
    capacity.each do |room,capacity| 
        @rooms[room] = Room.new(capacity) 
    end
  end

  def name
    @name.split(" ").map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room)
    @rooms.has_key?(room)
  end
  
  def check_in(person,room_name)
    if self.room_exists?(room_name)
        if @rooms[room_name].add_occupant(person)
          puts "check in successful"
        else
          puts "sorry, room is full"
        end
    else
        puts "sorry, room does not exist"
    end
  end

    def has_vacancy?
        @rooms.values.any? {|room| room.available_space > 0}
    end

    def list_rooms
        @rooms.each do |room_name, space|
            puts "#{room_name} : #{space.available_space}"
        end
    end
end
