require 'bank_helper'

describe BankHelper do
  describe 'initialization' do
    it 'inits with no transactions in array' do
      expect(subject.transactions).to eq([])
    end

    it 'The account balance starts at 0' do
      expect(subject.balance).to eq(0)
    end
  end
  
  describe '#deposit' do
    it 'Depositing money adds to an account balance' do
      subject.deposit(5)
      expect(subject.balance).to eq(5)
    end
  end

  describe '#withdraw' do
    it "Withdrawing money takes away from account's balance" do
      subject.deposit(5)
      subject.withdraw(3)
      expect(subject.balance).to eq(2)
    end
  end


end
