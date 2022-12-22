require_relative './base_decorator'

# Create a class that inherits from the base Decorator class.
class TrimmerDecorator < BaseDecorator
  # Implement a method correct_name
  def correct_name
    # output of @nameable.correct_name has a maximum of 10 characters
    @nameable.correct_name.length > 10 ? @nameable.correct_name[0...10] : nameable.correct_name
  end
end
