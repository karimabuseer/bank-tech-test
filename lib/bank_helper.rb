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
    deposit_confirmation(amount)
  end

  def deposit_confirmation(amount)
    puts "You have successfully deposited £#{amount}."
  end

  def withdraw(amount)
    overdraft_check(amount)
    @balance -= amount
    withdraw_confirmation(amount)
  end

  def withdraw_confirmation(amount)
    puts "You have successfully withdrawn £#{amount}."
  end


  def overdraft_check(amount)
    raise "You do not have sufficient funds to complete this request." if amount > @balance
  end

  def print_transactions
    puts 'date || credit || debit || balance'
  end

end
