require 'bank_helper'

describe BankHelper do
    it 'inits with no transactions in array' do
      expect(subject.transactions).to eq([])
    end

    it 'You can make a deposit' do
      expect(subject).to receive(:deposit).with(1)
      subject.deposit(10)
    end
end
