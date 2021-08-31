require 'transaction'
describe Transaction do
  let(:withdraw_five_transaction) { Transaction.new(debit: 5, balance: 10) }
  let(:deposit_five_transaction) { Transaction.new(credit: 5, balance: 10) }

  it 'formats the date correctly' do
    expect(withdraw_five_transaction.date).to eq("31/08/2021")
  end

  it 'formats the date correctly' do

  end

  it 'formats the date correctly' do

  end

  it 'produces a record of the transaction' do
    
  end
end