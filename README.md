# Bank Account Tech Test
- Tech test for week 10 of Maker's Academy
- Ruby program that mimics the functionality of a bank account. Accounts can be opened, and 
## Usage:
To use the app: 
1. Clone the repository and pull to your local machine.
2. Run the following command from the project directory:
```` 
bundle install
````
3. Open a ruby REPL (e.g IRB) via the Command Line, and load bank_account.rb
4. To create a new bank account:
````
account = BankAccount.new
```` 
5. To make a deposit in the account (in this example using £5):
````
account.deposit(5)
````

6. To make a withdrawal from the account (in this example using £3):
````
account.withdraw(3)
````

7. To view a history of transactions (starting with most recent):
````
account.print_statement
````

8. To run the automated test suite, run the following command from your command line whilst in the project directory:
````
rspec
````

## Approach
1. I initially created a bank account class following the TDD design pattern. I started with the deposit method
2. I then created a balance that deposits were added on to, and used the balance method to create a withdrawal method
3. I then considered Guard conditions. I decided a condition against overdrafts made sense. I also added a guard condition against withdrawing large sums of money, but decided against it. I'd already demonstrated I could TDD in a guard condition, and decided additional guards would be overengineering.
4. I created an array of hashes within the account that recorded prior withdrawals and deposits.
5. I extracted a class from the hashes, with each representing a single transaction.
6. Once this was done, I considered creating a printer class that would be in charge of printing out statements. I decided this wasn't necessary, as it makes sense for an account to be able to draw together a list of transactions (and account wasn't particularly bloated). I did decide to add a formatting method to each transaction class, however.
7. I then refactored my tests to work off of a stubbed method for transaction, and added helper methods to DRY out the automated tests.
8. I made some final refactors to the code - moved sensitive methods to be private. I also considered that it would make sense for the most recent transactions to come up first in the printed statement, so I changed my tests and code to reflect this. 
## Running App
Note the statements being printed in reverse order.
![Running App](https://github.com/karimabuseer/bank-tech-test/blob/main/images/running_app.png)


## User Stories
````
As a Customer,
So I can store my money,
I want to create an empty bank account
````  

````
As a Customer,
So I can keep my money secure,
I want to receive a deposit confirmation message
````

````
As a Customer,
So I can keep track of my deposits,
I want to be able to deposit money into my bank account
````

````
As a Customer,
So I can use my money,
I want to be able to withdraw money from my bank account
````

````
As a Customer,
So I can further my account,
I want to be able to see when transactions were made
````

````
As a Customer,
So I can track my account,
I want to be able to see my bank statement
````

````
As a Bank Owner,
So I can protect my bank,
I want to stop customers from withdrawing money they don't have
````
## Potential future user stories? 
````
As a Bank Owner,
To protect my customers,
I want to stop customers from withdrawing more than £300 at once
````

````
As a Bank Owner,
To prevent fraud,
I want to stop customers from depositing more than £300 at once
````
## CRC Cards and Object Models
![Account CRC card](https://github.com/karimabuseer/bank-tech-test/blob/main/images/account.png)

![Transaction CRC card](https://github.com/karimabuseer/bank-tech-test/blob/main/images/transaction.png)