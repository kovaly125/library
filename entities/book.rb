# frozen_string_literal: true

class Book
  attr_reader :title, :author
  include Validator

  def initialize(title, author)
    @title = title
    @author = author
    check_type(@title, String)
    check_type(author, Author)
    check_empty(@title)
  end
end
