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

6. To make a withdrawal from the account (in this example using £6):
````
account.deposit(6)
````

7. To view a history of transactions (starting with most recent):
````
account.print_statement
````

8. To run the automated test suite, run the following command from your command line whilst in the project directory:
````
rspec
````


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

## Usage
The program can be run using 