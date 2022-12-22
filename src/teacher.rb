require './person'

class Teacher < Person
  def initialize(specialization)
    @specialization = specialization
    super(name, age, parent_permission)
  end

  def can_use_services?
    true
  end
end
