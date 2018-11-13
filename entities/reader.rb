# frozen_string_literal: true

class Reader
  attr_reader :name, :email, :city, :streer, :house
  include Validator

  def initialize(name:, email:, city:, street:, house:)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
    temp = [@name, @email, @city, @street]
    temp.map { |x| check_type(x, String) }
    temp.map { |x| check_empty(x) }
    check_type(@house, Integer)
  end
end
