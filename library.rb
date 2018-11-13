# frozen_string_literal: true

class Library
  def initialize
    @authors = []
    @books = []
    @readers = []
    @orders = []
    loaded
  end

  def add_entity(entity)
    return @authors << entity if entity.instance_of?(Author)
    return @books << entity if entity.instance_of?(Book)
    return @readers << entity if entity.instance_of?(Reader)
    return @orders << entity if entity.instance_of?(Order)

    raise TypeError
  end

  def top_reader(quantity = 1)
    temp = Hash.new(0)
    @orders.each { |order| temp[order.reader] += 1 }
    temp = temp.sort_by { |_key, value| -value }
    temp[0, quantity].map { |x| x[0] }
  end

  def most_popular_books(quantity = 1)
    temp = Hash.new(0)
    @orders.each { |order| temp[order.book] += 1 }
    temp = temp.sort_by { |_key, value| -value }
    temp[0, quantity].map { |x| x[0] }
  end

  def number_of_readers_of_popular_books(quantity = 3)
    popular_books = most_popular_books(quantity)
    readers = []
    @orders.each { |order| readers << order.reader if popular_books.include?(order.book) }
    readers.uniq.count
  end

  def save
    temp = [@authors, @books, @readers, @orders]
    File.open('./entities.yaml', 'w') { |file| file.puts(temp.to_yaml) }
  end

  def loaded
    temp = YAML.load_file('./entities.yaml')
    temp.each { |array| array.each { |entity| add_entity(entity) } }
  end
end
