class Oystercard

DEAFAULT_BALANCE = 0
DEFAULT_STATUS = 'inactive'
MAXIMUM_BALANCE = 90

attr_accessor :balance
attr_reader :maximum , :active

  def initialize(balance= DEAFAULT_BALANCE)
    @balance = balance
    @maximum = MAXIMUM_BALANCE
    @active = false
  end

  def in_journey?
  @active
  end

  def touch_in
    @active = true
  end

  def touch_out
    @active = false
  end

  def top_up(amount)
    fail "Exceeds £#{maximum} maximum limit" if over_max?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  private

  def over_max?(amount)
    @balance + amount > @maximum
  end
end
