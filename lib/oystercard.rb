class Oystercard

DEAFAULT_BALANCE = 0    
attr_reader :balance
    
def initialize(balance= DEAFAULT_BALANCE)
  @balance = balance
end 

end