require './base_decorator'

#Create a class that inherits from the base Decorator class.
class TrimmerDecorator < BaseDecorator
  #Implement a method correct_name
  def correct_name
    #output of @nameable.correct_name has a maximum of 10 characters
    output = @nameable.correct_name
    maximum = 10
    output.length > maximum ? output[0...maximum] : output
  end
end