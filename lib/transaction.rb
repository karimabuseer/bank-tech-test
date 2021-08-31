# frozen_string_literal: true

class Transaction
  attr_reader :debit, :credit, :date, :balance

  def initialize(balance:, debit: nil, credit: nil)
    @date = Time.now.strftime('%d/%m/%Y')
    @debit = format_debit(debit)
    @credit = format_credit(credit)
    @balance = format_balance(balance)
  end

  def format_debit(debit)
    @debit = debit ? format('%.2f', debit) : ''
  end

  def format_credit(credit)
    @credit = credit ? format('%.2f', credit) : ''
  end

  def format_balance(balance)
    format('%.2f', balance)
  end

  def generate_formatted_record
    "#{@date} || #{@credit} || #{@debit} || #{@balance} "
  end
end
