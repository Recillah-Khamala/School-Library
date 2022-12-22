# Create a class Classroom
class Classroom
  # Setter and getter for @label
  attr_accessor :label
  attr_reader :students

  # @label instance variable, should be initialized in the constructor.
  def initialize(label)
    @label = label
    @students = []
  end

  #   Create the has-many side (a classroom has many students).
  def add_student(Student)
    @students.push(student) unless @students.include?(student)
    student.classroom = self
  end
end