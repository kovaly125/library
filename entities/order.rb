# frozen_string_literal: true

class Order
  attr_reader :book, :reader, :date
  include Validator

  def initialize(book, reader, date = Date.today)
    @book = book
    @reader = reader
    @date = date
    check_type(@book, Book)
    check_type(@reader, Reader)
    check_type(@date, Date)
  end
end
