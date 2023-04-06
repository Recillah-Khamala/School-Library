require 'json'
require_relative './app'
require_relative './book'
require_relative './teacher'
require_relative './student'
require_relative './rental'
require_relative './person'

class Data
  def initialize(app)
    @app = app
  end

  def save_book
    return if @app.books.empty?

    books = @app.books.map(&:as_json)
    File.write('book.json', JSON.dump(books))
  end

  def load_books
    return unless File.exist?('book.json')

    books = JSON.parse(File.read('books.json'))
    books.each do |book|
      new_book = Book.new(book['title'], book['author'])
      @app.books.push(new_book)
    end
  end

  def read_data
    load_books
    load_people
    load_rentals
  end

  def write_data
    save_book
    save_person
    save_rental
  end

  def save_person
    return if @app.people.empty?

    people_list = @app.people.map(&:as_json)
    File.write('./src/data/persons.json', JSON.dump(people_list))
  end

  def load_people
    return unless File.exist?('./src/data/persons.json')

    people_list = JSON.parse(File.read('./src/data/persons.json'))
    people_list.each do |person|
      if person['type'] == 'Student'
        new_student = Student.new(person['age'], person['name'], person['parent_permission'])
        @app.people.push(new_student)
      else
        new_teacher = Teacher.new(person['age'], person['specialization'], person['name'])
        @app.people.push(new_teacher)
      end
    end
  end

  def which_person(person_id)
    @app.people.each { |people| return people if people.id == person_id }
  end

  def which_book(book_title)
    @app.books.each { |book| return book if book.title == book_title }
  end

  def save_rental
    rentals = []
    @app.rental.each do |rental|
      rentals.push({ date: rental.date, person_id: rental.person.id, book_title: rental.book.title })
    end
    open('./src/data.rental.json', w) { |f| f << JSON.pretty_generate(rentals) }
  end

  def load_rentals
    return unless File.exist?('./src/data/rental.json')

    JSON.parse(File.read('./src/data/rental.json')).map do |rental|
      date = rental['date']
      person = which_person(rental['person_id'])
      book = which_book(rental['book_title'])
      rental = Rental.new(date, book, person)
      @app.rentals.push(rental)
    end
  end
end
