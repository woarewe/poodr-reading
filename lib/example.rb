# frozen_string_literal: true

class Human
  attr_accessor :age
  attr_accessor :name

  def initialize(age:, name:)
    @name = name
    @age = age
  end
end

