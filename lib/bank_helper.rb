class BankHelper
  attr_reader :balance

  def initialize
    @balance = 0 
  end

  def transactions
    []
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
