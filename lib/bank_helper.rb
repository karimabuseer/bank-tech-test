require_relative 'transaction'

class BankHelper
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    store_transaction_credit(amount)
    deposit_confirmation(amount)
  end

  def deposit_confirmation(amount)
    puts "You have successfully deposited £#{amount}."
  end

  def withdraw(amount)
    overdraft_check(amount)
    @balance -= amount
    store_transaction_debit(amount)
    withdraw_confirmation(amount)
  end

  def withdraw_confirmation(amount)
    puts "You have successfully withdrawn £#{amount}."
  end


  def overdraft_check(amount)
    raise "You do not have sufficient funds to complete this request." if amount > @balance
  end

  def store_transaction_credit(amount)
    @transactions << Transaction.new(credit: amount, debit: nil, balance: @balance)
  end

  def store_transaction_debit(amount)
    @transactions << Transaction.new(credit: nil, debit: amount, balance: @balance)
  end

  def print_transactions
    puts "#{header}"
    @transactions.map do |transaction| 
      puts "#{transaction.generate_formatted_record}"
    end
  end

  def header
    'date || credit || debit || balance'
  end

end
