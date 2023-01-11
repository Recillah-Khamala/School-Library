require 'json'

module Data
    def save_book(books)
        File.write('./database/books.json', JSON.generate(books))
    end

    def load_books
        if File.exists?('./database/books.json')
            listbooks = File.open('./database/books.json')
            info = listbooks.read
            JSON.parse(info)
        else
            File.write('./database/books.json', [])
        end
    end

    def save_person(person)
        File.write('./database/person.json', JSON.generate(person))
    end

    def load_people
        if File.exists?('./database/person.json')
            listpeole = File.open('./database/person.json')
            info = listpeole.read
            JSON.parse(info)
        else
            File.write('./database/person.json', [])
        end
    end

    def save_rental(rentals)
        File.write('./database.rentals.json', JSON.generate(rentals))
    end

    def load_rentals
        if File.exists?('./database/rentals.json')
            listrentals = File.open('./database/rentals.json')
            info = listrentals.read
            JSON.parse(info)
        else
            File.write('./database/rentals.json', [])
        end
    end
end

require 'json'
listbooks = File.open('./database/books.json')
info = File.read('./database/books.json')
puts JSON.parse(info).inspect