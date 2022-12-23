require_relative './rental'

# Create a class Book
class Book
  # Setters and getters for instance variables
  attr_accessor :title, :author
  attr_reader :rentals

  #   @title and @author instance variables, should be initialized in the constructor.
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
