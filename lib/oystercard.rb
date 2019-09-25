class Oystercard

DEAFAULT_BALANCE = 0
MAXIMUM_BALANCE = 90
MINIMUM_FARE = 1

attr_accessor :balance
attr_reader :maximum , :active , :entry_station , :history , :exit_station

  def initialize(balance= DEAFAULT_BALANCE)
    @balance = balance
    @maximum = MAXIMUM_BALANCE
    @active = false
    @entry_station = nil
    @exit_station = nil
    @history = []
  end

  def in_journey?
  !!entry_station
  end

  def touch_in(station)
    fail 'Insufficient funds' if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @exit_station = station
    record_history
    @exit_station = nil
    @entry_station = nil 
  end

  def top_up(amount)
    fail "Exceeds £#{maximum} maximum limit" if over_max?(amount)
    @balance += amount
  end

  def record_history
    entry = { :entry_station => @entry_station, :exit_station => @exit_station }
    @history << entry
  end

  private

  def over_max?(amount)
    @balance + amount > @maximum
  end

  def deduct(amount)
    @balance -= amount
  end

end
