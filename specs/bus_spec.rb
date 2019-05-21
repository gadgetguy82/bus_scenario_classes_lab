require('minitest/autorun')
require('minitest/rg')
require_relative('../bus')
require_relative('../person')
require_relative('../BusStop')
class BusTest < MiniTest::Test

  def setup
    @bus1 = Bus.new(1, "Ocean Terminal")
    @new_person = Person.new("John", 23)
    @remove_person = Person.new("Gim", 46)

    @person1 = Person.new("Harry", 24)
    @person2 = Person.new("Jerry", 34)
    @person3 = Person.new("Peter", 44)
    @bus_stop1 = BusStop.new("Morningside")
    @bus_stop1.add_to_queue(@person1)
    @bus_stop1.add_to_queue(@person2)
    @bus_stop1.add_to_queue(@person3)
  end

  def test_return_bus_number
    assert_equal(1, @bus1.route_number)
  end

  def test_return_bus_destination
    assert_equal("Ocean Terminal", @bus1.destination)
  end

  def test_bus_can_return_string
    assert_equal("Brum brum", @bus1.drive)
  end

  def test_how_many_passengers
    assert_equal(0, @bus1.how_many_passengers)
  end

  def test_pick_up
    @bus1.pick_up(@new_person)
    assert_equal([@new_person], @bus1.passengers)
  end

  def test_drop_off
    @bus1.pick_up(@new_person)
    @bus1.pick_up(@remove_person)
    @bus1.drop_off(@remove_person)
    assert_equal([@new_person], @bus1.passengers)
  end

  def test_empty
    @bus1.pick_up(@new_person)
    @bus1.pick_up(@remove_person)
    @bus1.empty
    assert_equal(0, @bus1.how_many_passengers)
  end

  def test_pick_up_all_passengers
    @bus1.pick_up_from_stop(@bus_stop1)
    assert_equal(3, @bus1.how_many_passengers)
    assert_equal(0, @bus_stop1.queue.length)
  end
end
