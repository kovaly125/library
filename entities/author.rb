# frozen_string_literal: true

class Author
  attr_reader :name, :biography
  include Validator

  def initialize(name, biography = '')
    @name = name
    @biography = biography
    check_type(@name, String)
    check_empty(@name)
  end
end
