class Journey

MINIMUM_FARE = 1 

attr_reader :entry_station , :exit_station , :journey_history
attr_accessor :journey_complete , :fare

  def initialize
    @entry_station = nil
    @exit_station = nil
    @journey_complete = false
    @fare = 0
    @journey_history = []
  end

  def record_history
    @journey_complete = true if (entry_station != nil) && (exit_station != nil)
    entry = { :entry_station => @entry_station, :exit_station => @exit_station }
    @journey_history << entry
    @entry_station, @exit_station = nil, nil 
  end

  def start_journey(station)
    end_journey(nil) if @entry_station
    @entry_station = station    
  end

  def end_journey(station)
    @exit_station = station
    record_history
    calculate_fare   
  end

  def calculate_fare
    return @fare += 6 if @journey_complete == false 
    @fare += MINIMUM_FARE
  end

end
