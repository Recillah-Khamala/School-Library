require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './classroom'
require_relative './person'

class App
    # setters and getters
    attr_accessor :books, :rentals, :people

    # constructor method
    def initialize
        @books = []
        @rentals = []
        @people = []
    end

    # method for listing all books.
    def list_all_books
        if @books.empty?
            puts 'No books available yet!, go ahead and create one'
        else
            @books.each_with_index do |book, index| puts "#{index + 1} Title: #{book.title}, Author: #{book.author}"
            end
        end
    end

    # method for listing all people
    def list_all_people
        if @people.empty?
            puts 'No one has been listed yet!, kindly add a person' 
        else
            @people.each_with_index do |person, index| puts "#{index + 1} name: #{person.name} age: #{person.age} person_id: #{person.id}" 
            end
        end
    end
    
    # Create a person (teacher or student, not a plain Person).
    def create_person()
        puts "Do you want to create a student(1) or a teacher(2)? [Input the number]:"
        opt = gets.chomp
        case opt
        when '1'
            puts 'Age:'
            age = gets.chomp
            puts 'Name:'
            name = gets.chomp
            puts 'Has parent\'s permission? [Y/N]:'
            perental_permission = gets.chomp
            puts 'Classroom:'
            classroom = gets.chomp

            new_student = Student.new(age, name, classroom)@people << new_student unless @people.include ?
            print "\n New student #{name} aged #{age} created successfully\n\n"  
        when '2'
            puts 'Age:'
            age = gets.chomp
            puts 'Name:'
            name = gets.chomp
            puts 'Specialization'
            specialization = gets.chomp

            new_teacher = Teacher.new(age, name,specialization) @people << new_teacher unless @people.include ?
            puts "\n New teacher #{name} created successfully\n\n"
        end
    end

    # Method for creating a book.
    def create_book()
        puts 'Create a new book'
        puts 'Title:'
        title = gets.chomp
        puts 'Author:'
        author = gets.chomp

        new_book = Book.new(title, author)
        @books << new_book unless @books.include ?(new_book)
        puts "\n New book #{title} by #{author} created successfully\n\n"
    end

    # method for creating a rental.
    def create_rental()
        puts 'Select a book from the following list by number'
        @books.each_with_index do |book, index|
            puts "#{index} Title: '#{book.title}', Author: '#{book.author}'"
        end
        book_data = gets.chomp.to_i

        puts 'Select a person from the following list by number'
        @people.each_with_index do |person, index|
            puts "#{index} [#{person.class}] Name: #{person.name}, ID:#{person.id}, Age: #{person.age}"
        end
        person_data = gets.chomp.to_i

        print 'Date:'
        date = gets.chomp

        rental = Rental.new(date, @books[book_data], @people[person_data])
        @rentals.push(rental)
        puts 'Rental created succssfully'
    end

    # method for listing all rentals for a given person id
    def all_rentals_by_a_person()
        print 'ID:'
        id = gets.chomp.to_i
        puts 'Rentals:'
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
