# Create a class Rental
class Rental
  #Setter and getter for @date
  attr_accessor :date

  def initialize(date)
    @date = date
  end
end