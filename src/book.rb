# Create a class Book 
class Book
  # Setters and getters for instance variables
  attr_accessor :title, :author

  #   @title and @author instance variables, should be initialized in the constructor.
  def initialize(title, author)
    @title = title
    @author = author
  end
end