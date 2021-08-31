require 'bank_helper'

describe BankHelper do
    it 'inits with no transactions in array' do
      expect(subject.transactions).to eq([])
    end
end