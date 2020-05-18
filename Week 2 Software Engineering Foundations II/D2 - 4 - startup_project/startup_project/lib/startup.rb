require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.has_key?(title)
  end

  def >(another_startup)
    self.funding > another_startup.funding
  end

  def hire(name, title)
    if self.valid_title?(title)
        @employees << Employee.new(name,title)
    else
        raise 'Invalid Title'
    end
  end

  def size
    @employees.size
  end

  def pay_employee(employee)
    if @salaries[employee.title] < @funding
      employee.pay(@salaries[employee.title])
      @funding -= @salaries[employee.title]
    else
        raise "insufficient funds"
    end
  end

    def payday
        @employees.each {|emp| self.pay_employee(emp)}
    end
  
end
# Failures:

#   1) Startup PART 2 #hire when the title is invalid should not add to @employees
#      Failure/Error: expect(startup_1.employees).to eq([])
#      NoMethodError:
#        undefined method `employees' for #<Startup:0x000000000719e108>
#        Did you mean?  employee
#      # ./spec/startup_spec.rb:124:in `block (5 levels) in <top (required)>'

#   2) Startup PART 2 #hire when the title is valid should add the new Employee instance to @employees
#      Failure/Error: employee = startup_1.employees[0]
#      NoMethodError:
#        undefined method `employees' for #<Startup:0x00000000070a01c0>
#        Did you mean?  employee
#      # ./spec/startup_spec.rb:136:in `block (5 levels) in <top (required)>'

# Finished in 0.0456 seconds (files took 0.34551 seconds to load)
# 5 examples, 2 failures
