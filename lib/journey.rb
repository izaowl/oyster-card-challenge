class Journey
  attr_reader :entry_station, :exit_station, :fare
  FARE = 1
  PENALTY = 6

  def in_journey?
    @entry_station 
  end
  
  def starting_journey(entry_station)
    @entry_station = entry_station
  end

  def ending_journey(exit_station)
    @exit_station = exit_station
  end

  def fare
    FARE
  end

  def penalty
    PENALTY
  end

  def complete?
    unless @exit_station == nil
    end
  end

  def calculate_penalty(exit_station)
    if exit_station == nil
      @fare = PENALTY
    else
      @fare = FARE
    end
  end

end