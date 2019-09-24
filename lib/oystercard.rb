class Oystercard

DEAFAULT_BALANCE = 0 
MAXIMUM_BALANCE = 90

attr_accessor :balance
attr_reader :maximum
    
  def initialize(balance= DEAFAULT_BALANCE)
    @balance = balance
    @maximum = MAXIMUM_BALANCE
  end 

  def top_up(amount)
    fail "Exceeds £#{maximum} maximum limit" if over_max?(amount)
    @balance += amount
  end
 
  private

  def over_max?(amount)
    @balance + amount > @maximum
  end
end