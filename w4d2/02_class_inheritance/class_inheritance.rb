# Class Inheritance
# This mini-project will apply the skills you learned in last night's inheritance reading.

# Learning Goals 
# Understand how a subclass inherits from a superclass
# Know how to override a parent class's method
# Know when and how to use super
#--------------------------------------------------------
# Employee and Manager
# Write a class Employee that has attributes that return the employee's name, title, salary, and boss.

class Employee
    attr_reader :name, :boss, :salary
    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end
    def bonus(mult)
        salary * mult
    end
    private
    attr_accessor :title
end
#--------------------------------------------------------
# Write another class, Manager, that extends Employee. Manager should have an attribute that holds an array of all employees assigned to the manager. Note that managers might report to higher level managers, of course.

class Manager < Employee
    attr_accessor :employees
    def initialize(name,title,salary,boss=nil)
        super(name,title,salary,boss)
        @employees = []
    end


    def total_salaries
        sum = 0
        employees.each do |worker|
            if worker.is_a?(Array)
                sum += worker.salary + worker.total_salaries
            else
                sum += worker.salary
            end
        end
        sum        
    end

    def bonus(mult)
        self.total_salaries * mult
    end

    def employee=(worker)
        employees << worker
    end
end


#--------------------------------------------------------
# Add a method, bonus(multiplier) to Employee. Non-manager employees should get a bonus like this

# bonus = (employee salary) * multiplier
# Managers should get a bonus based on the total salary of all of their subordinates, as well as the manager's subordinates' subordinates, and the subordinates' subordinates' subordinates, etc.

# bonus = (total salary of all sub-employees) * multiplier
# Testing
# If we have a company structured like this:

# Name	Salary	Title	Boss
# Ned	\$1,000,000	Founder	nil
# ("Darren", "TA Manager, 78000, "ted")
# Employee.new(*Shawna", "cashier", 12000, "Ted")
# Employee.new("Ned", "cashier", 12000, "Ted")	
# Employee.new(*Shawna", "cashier", 12000, "Ted")	Darren
# David	\$10,000	TA	Darren
# then we should have bonuses like this:

# ned.bonus(5) # => 500_000
# darren.bonus(4) # => 88_000
# david.bonus(3) # => 30_000