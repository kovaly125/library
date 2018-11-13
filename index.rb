# frozen_string_literal: true

require './autoload'

my_library = Library.new

pushkin = Author.new('Alexander Pushkin')
my_library.add_entity(pushkin)
pushkin_book1 = Book.new('Ruslan i Ludmyla', pushkin)
my_library.add_entity(pushkin_book1)
pushkin_book2 = Book.new('Pikovaya Dama', pushkin)
my_library.add_entity(pushkin_book2)
pushkin_book3 = Book.new('Prorok', pushkin)
my_library.add_entity(pushkin_book3)
sergey = Reader.new(name: 'Sergey', email: 'sergey@blabla.com', city: 'Dnipro', street: 'Yavornitskogo', house: 10)
piter = Reader.new(name: 'Piter', email: 'piter@blabla.com', city: 'Kiev', street: 'Zavodskaya', house: 22)
my_library.add_entity(sergey)
my_library.add_entity(piter)

order1 = Order.new(pushkin_book1, piter)
order2 = Order.new(pushkin_book2, piter)
order3 = Order.new(pushkin_book3, piter)
order4 = Order.new(pushkin_book1, sergey)
order5 = Order.new(pushkin_book2, sergey)
order6 = Order.new(pushkin_book3, sergey)
my_library.add_entity(order1)
my_library.add_entity(order2)
my_library.add_entity(order3)
my_library.add_entity(order4)
my_library.add_entity(order5)
my_library.add_entity(order6)

my_library.save
my_library.top_reader(2)
my_library.most_popular_books
my_library.number_of_readers_of_popular_books
