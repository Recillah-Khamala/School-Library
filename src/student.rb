require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'unknown', parent_permission = 'true')
    @classroom = classroom
    super(age, name, parent_permission)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
