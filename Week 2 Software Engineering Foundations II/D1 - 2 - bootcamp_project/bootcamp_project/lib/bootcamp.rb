class Bootcamp

    def initialize (name,slogan, student_capacity)
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

def hire (string)
    teachers << string
end


def enroll(string)
    if students.length < @student_capacity
        student_capacity << string
        return true
    else
        return false
    end
end

def enrolled?(string)
    students.include?(string)
end


def student_to_teacher_ratio(n)
    students.length / teachers.length 
end

def add_grade(name, num)
    if enrolled(name)
        grades[name] << num
        return true
    else
        return false
    end
end

end 