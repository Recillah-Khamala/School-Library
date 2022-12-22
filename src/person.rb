require_relative './nameable'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'

# Make sure that your Person class inherits from Nameable
class Person < Nameable
  attr_accessor :name, :age, 
  attr_reader :id, :rentals

  def initialize(age, name = 'unknown', parent_permission: true)
    super()

    @id = Random.rand(1...1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission == 'true'
  end

  # Make sure that this class has a method correct_name implemented.
  def correct_name
    # It should simply return the name attribute.
    @name
  end

  private :of_age?

  def of_age?
    @age >= 18
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
