class Oystercard

DEAFAULT_BALANCE = 0    
attr_accessor :balance
    
  def initialize(balance= DEAFAULT_BALANCE)
    @balance = balance
  end 

  def top_up(amount)
    @balance += amount.to_f
  end
end