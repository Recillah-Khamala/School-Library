# Create a class Classroom
class Classroom
  # Setter and getter for @label
  attr_accessor :label

  # @label instance variable, should be initialized in the constructor.
  def initialize(label)
    @label = label
  end
end