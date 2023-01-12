require 'pry'
require_relative './app'
require_relative './storage'

class Main
  def initialize
    @app = App.new
    @data = Data.new(@app)
    @data.read_data
  end

  def space
    char = '-'
    puts char * 50
  end

  def welcome
    space
    puts 'welcome To School Library App!'
    space
  end

  def exit_app
    puts 'Thank you for using School Library App!'
    @data.write_data
  end

  def list_options
    welcome

    puts '
    Please choose an option by entering a number:
    1 - List all books
    2 - List all people
    3 - Create person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit'

    print 'Option: '
    response = gets.chomp.to_i
    return exit_app if option == 7

    options(response)
  end

  def options(response)
    case response
    when 1
      @app.list_all_books
    when 2
      @app.list_all_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.all_rentals_by_a_person
    else
      puts 'Choise not listed!'
    end

    list_options
  end
end

main = Main.new
main.list_options
