require_relative './nameable'

# Make sure that it inherits from Nameable.
class BaseDecorator < Nameable
  attr_accessor :nameable

  # In the constructor assign a nameable object from params to an instance variable.
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  # Implement the correct_name method that returns the result of the correct_name method of the @nameable.
  def correct_name
    @nameable.correct_name
  end
end
