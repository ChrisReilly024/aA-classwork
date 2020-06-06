class Contact
    attr_accessor :first_name, :middle_name, :last_name
    def initialize(first_name, middle_name, last_name)
        @first_name = first_name
        @middle_name = middle_name
        @last_name = last_name
    end
end

anakin = Contact.new('Anakin', "d.", 'Skywalker')

pp anakin