# frozen_string_literal: true

require_relative 'transaction'

class BankAccount
  attr_reader :balance

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    store_transaction_credit(amount)
    deposit_confirmation(amount)
  end

  def withdraw(amount)
    overdraft_check(amount)
    @balance -= amount
    store_transaction_debit(amount)
    withdraw_confirmation(amount)
  end


  def print_statement
    puts header.to_s
    puts print_transactions
  end

  private

  def deposit_confirmation(amount)
    puts "You have successfully deposited £#{amount}."
  end

  def withdraw_confirmation(amount)
    puts "You have successfully withdrawn £#{amount}."
  end

  def overdraft_check(amount)
    if amount > @balance
      raise 'You do not have sufficient funds to complete this request.'
    end
  end

  def store_transaction_credit(amount)
    @transactions << Transaction.new(credit: amount, debit: nil, balance: @balance)
  end

  def store_transaction_debit(amount)
    @transactions << Transaction.new(credit: nil, debit: amount, balance: @balance)
  end

  def print_transactions
    @transactions.reverse.map do |transaction|
      transaction.generate_formatted_record.to_s
    end
  end

  def header
    'date || credit || debit || balance'
  end
end
