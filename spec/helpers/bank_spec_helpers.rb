def deposit_five
  subject.deposit(5)
end

def deposit_three
  subject.deposit(3)
end

def deposit_two
  subject.deposit(2)
end

def withdraw_three
  subject.withdraw(3)
end

def withdraw_one
  subject.withdraw(1)
end

def mock_print_one_deposit
  allow(subject).to receive(:print_transactions).and_return('31/08/2021 || 5.00 || || 5.00 ')
end

def mock_print_two_deposits
  allow(subject).to receive(:print_transactions).and_return("31/08/2021 || 2.00 || || 5.00 \n31/08/2021 || 3.00 || || 3.00 \n")
end

def mock_one_deposit_one_withdrawal
  allow(subject).to receive(:print_transactions).and_return("31/08/2021 || || 1.00 || 2.00 \n31/08/2021 || 3.00 || || 3.00 \n")
end

