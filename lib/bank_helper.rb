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
    overdraft_check(amount)
    @balance -= amount
  end

  def overdraft_check(amount)
    raise "You do not have sufficient funds to complete this request." if amount > @balance
  end
end
