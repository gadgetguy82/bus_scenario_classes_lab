require('minitest/autorun')
require('minitest/rg')
require_relative('../person')

class PersonTest < MiniTest::Test

def setup
  @person1 = Person.new("John", 23)
end

def test_name_of_person
  assert_equal("John", @person1.name)
end

def test_age
  assert_equal(23, @person1.age)
end
end
