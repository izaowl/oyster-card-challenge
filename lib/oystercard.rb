class Oystercard 
attr_reader :balance, :entry_station, :list_of_journeys
LIMIT = 90
FARE = 6
MIN_LIMIT = 1

  def initialize
    @balance = 0
    @list_of_journeys = []
  end

  def top_up(value)
    raise "Error: max balance hit #{LIMIT}" if  (@balance+value>90) || @balance > LIMIT || value > LIMIT
    @balance += value
  end

  def touch_in(station)
    raise "Not enough money, less than #{MIN_LIMIT}" if @balance < MIN_LIMIT
    @entry_station = station
  end
  
  def touch_out(exit_station)
    deduct
    @exit_station = exit_station
    @list_of_journeys << { entry: @entry_station, exit: @exit_station }
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end
  
  def list_journeys
    return @list_of_journeys
  end

  private

  def deduct
    @balance = @balance - FARE
  end  
end
