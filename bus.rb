class Bus
  attr_reader :route_number, :destination, :passengers

  def initialize(route_number, destination)
    @route_number = route_number
    @destination = destination
    @passengers = []
  end

  def drive
    return "Brum brum"
  end

  def how_many_passengers
    return @passengers.length
  end

  def pick_up(person)
    @passengers << person
  end

  def drop_off(person)
    @passengers.delete(person)
    # for passenger in @passengers
    #   if (passenger.name == person.name)
    #     @passengers.delete(passenger)
    #   end
    # end
  end

  def empty
    @passengers = []
  end

  def pick_up_from_stop(bus_stop)
    for passenger in bus_stop.queue
      pick_up(passenger)
    end
    bus_stop.empty
  end
end
