class Oystercard

DEAFAULT_BALANCE = 0
MAXIMUM_BALANCE = 90
MINIMUM_FARE = 1

attr_accessor :balance
attr_reader :maximum , :active

  def initialize(balance= DEAFAULT_BALANCE)
    @balance = balance
    @active = false
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
  end

  def top_up(amount)
    fail "Exceeds £#{maximum} maximum limit" if over_max?(amount)
    @balance += amount
  end

  private

  def over_max?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end

end
