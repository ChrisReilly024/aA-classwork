class Passenger
    attr_reader :name
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(flight_num)
        @flight_numbers.include?(flight_num.upcase)
    end
end