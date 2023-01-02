require_relative './person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown')
    @specialization = specialization
    super(age, name)
  end

  def can_use_services?
    true
  end
end
