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

    it 'Succesfully depositing money gives me a confirmation' do
      expect(STDOUT).to receive(:puts).with("You have successfully deposited £5.")
      subject.deposit(5)
    end
  end

  describe '#withdraw' do
    it "Withdrawing money takes away from account's balance" do
      subject.deposit(5)
      subject.withdraw(3)
      expect(subject.balance).to eq(2)
    end

    it 'Prevents customers from withdrawing more than their account balance' do
      expect{ subject.withdraw(1) }.to raise_error("You do not have sufficient funds to complete this request.")
    end

    it 'notifies me when I succesfully withdraw money' do
      subject.deposit(5)
      expect(STDOUT).to receive(:puts).with("You have successfully withdrawn £3.")
      subject.withdraw(3)
    end
  end

  describe '#print_transactions' do
    it 'prints off just headers when there are no transactions' do
      expect(STDOUT).to receive(:puts).with("date || credit || debit || balance")
      subject.print_transactions
    end
  end


end
