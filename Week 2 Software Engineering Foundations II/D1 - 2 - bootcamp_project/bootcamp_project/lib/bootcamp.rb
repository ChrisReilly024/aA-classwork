class Bootcamp

    def initialize(name,slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new {|h,k| h[k] = []}
    end
  
def name
    @name
end

def slogan
    @slogan
end

def teachers
    @teachers
end

def students
    @students
end

def hire(name)
    teachers << name
end


def enroll(name)
    if students.length < @student_capacity
        students << name
        return true
    else
        return false
    end
end

def enrolled?(name)
    students.include?(name)
end


def student_to_teacher_ratio
    (@students.length / @teachers.length).floor
end

def add_grade(name, num)
    if enrolled?(name)
        @grades[name] << num
        return true
    else
        return false
    end
end

    def num_grades(student)
        @grades[student].length
    end 

    def average_grade(student)
        if !enrolled?(student) || @grades[student].length == 0
            return nil
        else
            (@grades[student].sum / @grades[student].length).floor
        end
    end
end

    # #student_to_teacher_ratio
    # should return an integer representing the ratio between # students to 1 teacher rounded down to the nearest integer (FAILED - 1)
    # #add_grade
    #   should accept a student (string) and a grade (number) and add that grade to the student's grades array inside of the @grades hash
    #   when the student is already enrolled
    #     should add the grade to the student's grades array inside of the @grades hash (FAILED - 2)
    #     should return true (FAILED - 3)
    #   when the student is not enrolled in the bootcamp
    #     should not add the grade (FAILED - 4)
    #     should return false
    # #num_grades
    #   should accept a student (string) and return the number of grades they have (FAILED - 5)
    # #average_grade
    #   should accept a student (string) and return a number representing their average grade rounded down to the nearest integer (FAILED - 6)
    #   should return nil if the student has no grades or is not enrolled (FAILED - 7)