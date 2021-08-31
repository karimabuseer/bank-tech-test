require 'bank_helper'

describe BankHelper do
    it 'inits with no transactions in array' do
      expect(subject.transactions).to eq([])
    end

    it 'The account balance starts at 0' do
      expect(subject.balance).to eq(0)
    end
end
