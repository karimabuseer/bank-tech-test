# frozen_string_literal: true

require 'bank_account'
require 'transaction'

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
      expect($stdout).to receive(:puts).with('You have successfully deposited £5.')
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
      expect { subject.withdraw(1) }.to raise_error('You do not have sufficient funds to complete this request.')
    end

    it 'notifies me when I succesfully withdraw money' do
      subject.deposit(5)
      expect($stdout).to receive(:puts).with('You have successfully withdrawn £3.')
      subject.withdraw(3)
    end
  end

  describe '#print_transactions' do
    it 'prints off just headers when there are no transactions' do
      expect { subject.print_statement }.to output(("date || credit || debit || balance\n")).to_stdout
    end
    context 'single deposit' do
    it 'prints off a single deposit correctly' do
      subject.deposit(5)
      allow(subject).to receive(:print_transactions).and_return('31/08/2021 || 5.00 ||  || 5.00 ')
      expect do
        subject.print_statement
      end.to output(("date || credit || debit || balance\n31/08/2021 || 5.00 ||  || 5.00 \n")).to_stdout
    end
  end
  context 'do thing' do
    it 'prints off two deposits correctly' do
      subject.deposit(3)
      subject.deposit(2)
      allow(subject).to receive(:print_transactions).and_return("31/08/2021 || 3.00 ||  || 3.00 \n31/08/2021 || 2.00 ||  || 5.00 ")
      expect do
        subject.print_statement
      end.to output(("date || credit || debit || balance\n31/08/2021 || 3.00 ||  || 3.00 \n31/08/2021 || 2.00 ||  || 5.00 \n")).to_stdout
    end
  end

    it 'prints off a single deposit and a single withdrawal' do
      subject.deposit(3)
      subject.withdraw(1)
      allow(subject).to receive(:print_transactions).and_return("31/08/2021 || 3.00 ||  || 3.00 \n31/08/2021 ||  || 1.00 || 2.00 \n")
      expect do
        subject.print_statement
      end.to output("date || credit || debit || balance\n31/08/2021 || 3.00 ||  || 3.00 \n31/08/2021 ||  || 1.00 || 2.00 \n").to_stdout
    end
  end
end
