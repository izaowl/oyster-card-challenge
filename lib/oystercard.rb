class Oystercard 
attr_reader :balance, :in_journey
LIMIT = 90
FARE = 6

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    raise "Error: max balance hit #{LIMIT}" if  (@balance+value>90) || @balance > LIMIT || value > LIMIT
    @balance += value
  end

  def deduct
    @balance = @balance - FARE
  end

  def touch_in
    @in_journey = true
  end
  
  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

end
