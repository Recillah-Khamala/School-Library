# Create a class Rental
class Rental
  # Setter and getter for @date
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    @book['rentals'] = self

    @person = person
    @person['rentals'] = self
  end
end
