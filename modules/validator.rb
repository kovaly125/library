# frozen_string_literal: true

module Validator
  def check_type(entity, type)
    raise TypeError unless entity.instance_of?(type)
  end

  def check_empty(string)
    raise ArgumentError if string.empty?
  end
end
