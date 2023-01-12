require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'unknown', parent_permission: true)
    @classroom = classroom
    super(age, name, parent_permission)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  #   Create the belongs-to side (a student belongs to a classroom).
  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def as_json()
    {
      type: Student,
      name: @name,
      id: @id,
      age: @age,
      classroom: @classroom,
      parent_permission: @parent_permission
    }
  end
end
