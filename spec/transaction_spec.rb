# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:withdraw_five_transaction) { Transaction.new(debit: 5, balance: 10) }
  let(:deposit_three_transaction) { Transaction.new(credit: 3, balance: 10) }

  it 'formats the date correctly' do
    expect(withdraw_five_transaction.date).to eq('31/08/2021')
  end

  it 'formats a withdrawal correctly' do
    expect(withdraw_five_transaction.debit).to eq('5.00')
  end

  it 'formats a deposit correctly' do
    expect(deposit_three_transaction.credit).to eq('3.00')
  end

  it 'produces a record of the transaction' do
    expect(withdraw_five_transaction.generate_formatted_record).to eq('31/08/2021 ||  || 5.00 || 10.00 ')
  end
end
