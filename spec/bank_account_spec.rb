# frozen_string_literal: true

require 'bank_account'
require 'transaction'

describe BankAccount do
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
      deposit_five
      expect(subject.balance).to eq(5)
    end

    it 'Succesfully depositing money gives me a confirmation' do
      expect($stdout).to receive(:puts).with('You have successfully deposited £5.')
      deposit_five
    end
  end

  describe '#withdraw' do
    it "Withdrawing money takes away from account's balance" do
      deposit_five
      withdraw_three
      expect(subject.balance).to eq(2)
    end

    it 'Prevents customers from withdrawing more than their account balance' do
      expect { subject.withdraw(1) }.to raise_error('You do not have sufficient funds to complete this request.')
    end

    it 'notifies me when I succesfully withdraw money' do
      deposit_five
      expect($stdout).to receive(:puts).with('You have successfully withdrawn £3.')
      withdraw_three
    end
  end

  describe '#print_transactions' do

    it 'prints off just headers when there are no transactions' do
      expect { subject.print_statement }.to output(("date || credit || debit || balance\n")).to_stdout
    end

    it 'prints off a single deposit correctly' do
      deposit_five
      mock_print_one_deposit
      expect { subject.print_statement } .to output(("date || credit || debit || balance\n31/08/2021 || 5.00 ||  || 5.00 \n")).to_stdout
    end

    it 'prints off two deposits correctly' do
      deposit_three
      deposit_two
      mock_print_two_deposits
      expect { subject.print_statement } .to output("date || credit || debit || balance\n31/08/2021 || 2.00 ||  || 5.00 \n31/08/2021 || 3.00 ||  || 3.00 \n").to_stdout
    end

    it 'prints off a single deposit and a single withdrawal' do
      deposit_three
      withdraw_one
      mock_one_deposit_one_withdrawal
      expect { subject.print_statement } .to output("date || credit || debit || balance\n31/08/2021 ||  || 1.00 || 2.00 \n31/08/2021 || 3.00 ||  || 3.00 \n").to_stdout
    end
  end
end
