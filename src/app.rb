require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './classroom'
require_relative './person'
require_relative './storage'
require 'json'

class App
  # setters and getters
  attr_accessor :books, :rentals, :people

  # constructor method
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # method for listing all books.
  def list_all_books
    if @books.empty?
      puts 'No books available yet!, go ahead and create one'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1} Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  # method for listing all people
  def list_all_people
    if @people.empty?
      puts 'No one has been listed yet!, kindly add a person'
    else
      @people.each_with_index do |person, index|
        puts "#{index + 1} name: #{person.name} age: #{person.age} person_id: #{person.id}"
      end
    end
  end

  # Create a person (teacher or student, not a plain Person).
  def create_person()
    puts 'Want to create a student(1) or a teacher(2)? [Input number]: '
    opt = gets.chomp
    case opt
    when '1'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Has parent_permission? [Y/N]: '
      permission = gets.chomp.downcase == 'y'
      new_student = Student.new('classroom', age, name, parent_permission: permission)
      @people << new_student unless @people.include?(new_student)
      puts "New student #{name} aged '#{age}' created successfully"
    when '2'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      new_teacher = Teacher.new(age, specialization, name)
      @people << new_teacher unless @people.include?(new_teacher)
      puts "New teacher #{name} created successfully"
    end
  end

  # Method for creating a book.
  def create_book()
    puts 'Create a new book'
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp

    new_book = Book.new(title, author)
    @books << new_book unless @books.include?(new_book)
    puts "New book #{title} by #{author} created successfully"
  end

  # method for creating a rental.
  def create_rental()
    puts 'Select a book from the following list by number'
    list_all_books
    book_data = get_user_input_as_int('book_data: ')

    puts 'Select a person from the following list by number'
    list_all_people
    person_data = get_user_input_as_int('person_data: ')

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_data], @people[person_data])
    @rentals.push(rental)
    puts 'Rental created succssfully'
  end

  # method for listing all rentals for a given person id
  def all_rentals_by_a_person()
    print 'ID: '
    id = gets.chomp.to_i
    puts 'Rentals: '
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Person: #{rental.person.name}
                Date: #{rental.date},
                Book: #{rental.book.title} by #{rental.book.author}"
      else
        puts 'No rentals for the person with that id'
      end
    end
  end
end
