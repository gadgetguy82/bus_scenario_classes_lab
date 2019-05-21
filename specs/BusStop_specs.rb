require('minitest/autorun')
require('minitest/rg')
require_relative('../BusStop')
require_relative('../Person')

class BusStopTest < MiniTest::Test

  def setup
    @person1 = Person.new("Harry", 24)
    @person2 = Person.new("Jerry", 34)
    @person3 = Person.new("Peter", 44)
    @bus_stop1 = BusStop.new("Morningside")
  end

  def test_add_to_queue
    @bus_stop1.add_to_queue(@person1)
    @bus_stop1.add_to_queue(@person2)
    @bus_stop1.add_to_queue(@person3)
    assert_equal(3, @bus_stop1.queue.length)
  end


end
