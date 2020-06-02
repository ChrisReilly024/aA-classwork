# Class Inheritance
# This mini-project will apply the skills you learned in last night's inheritance reading.

# Learning Goals
# Understand how a subclass inherits from a superclass
# Know how to override a parent class's method
# Know when and how to use super
# Employee and Manager
# Write a class Employee that has attributes that return the employee's name, title, salary, and boss.

class Employee 
    attr_reader :name, :title, :salary, :boss
    def initialize(name, title, salary, boss)
        @name = name 
        @title = title 
        @salary = salary 
        @boss = boss 
    end

    def bonus(multiplier)
        salary * multiplier
    end

end
# ned = Manager.new("Ned", "Founder",  1,000,000, nil)

class Manager < Employee
    attr_accessor :employees
    def initialize(name, title, salary, boss)
        @employees = []
        super
    end

    def bonus(multiplier)
        get_salaries * multiplier
        # employees.sum {|emp| emp.salary} * multiplier
    end

    def get_salaries
        total = 0
        employees.each do |emp|
            if emp.is_a?(Manager)
                total += emp.salary
                total += emp.get_salaries
            else #now we check if they're manager
                total += emp.salary
            end
        end
        total 
    end

    def add_sub(employee)
        employees << employee
    end

end




# Managers should get a bonus based on the total salary of all of their subordinates, as well as the manager's subordinates' subordinates, and the subordinates' subordinates' subordinates, etc.

# bonus = (total salary of all sub-employees) * multiplier
# Testing
# If we have a company structured like this:
=begin
Name	Salary	Title	Boss
Ned = $1,000,000, Founder, nil
Darren = $78,000, TA Manager, Ned
Shawna = $12,000,TA, Darren
David = $10,000,TA, Darren
then we should have bonuses like this:

ned.bonus(5) # => 500_000
darren.bonus(4) # => 88_000
david.bonus(3) # => 30_000
=end


ned = Manager.new("Ned", "Founder",  1000000, nil)
darren = Manager.new("Darren" ,"TA Manager", 78000, ned)
shawna = Employee.new('Shawna', 'TA', 12000, 'Darren')
david = Employee.new('David', 'TA', 10000, 'Darren')

ned.add_sub(darren)
darren.add_sub(shawna)
darren.add_sub(david)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)