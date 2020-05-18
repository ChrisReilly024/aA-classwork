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
  
    def average_salary
      sum = 0
      (@employees.map { |emp| @salaries[emp.title] }.sum)/(@employees.length*1.0)
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        @salaries = startup.salaries.merge(@salaries)
        startup.employees.each {|emp| @employees << emp}
        startup.close
    end
end

