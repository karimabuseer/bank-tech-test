class Transaction
  attr_reader :debit, :credit, :date, :balance
  def initialize(debit: nil, credit: nil, balance:)
    @date = Time.now.strftime("%d/%m/%Y")
    @debit = format_debit(debit)
    @credit = format_credit(credit)
    @balance = format_balance(balance)
  end

  def format_debit(debit)
    debit ? @debit = sprintf('%.2f', debit) : @debit = ""
  end

  def format_credit(credit)
    credit ? @credit = sprintf('%.2f', credit) : @credit = ""
  end

  def format_balance(balance)
    sprintf('%.2f', balance)
  end
end
