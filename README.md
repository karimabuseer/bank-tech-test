# Bank Account Tech Test
- Tech test for week 10 of Maker's Academy
- Ruby program that mimics the functionality of a bank account. Accounts can be opened, and 
## Specs:
- Can deposit money
- Can withdraw money
- Adding or withdrawing adds to balance
- Can print your bank statement which provides history of deposits etc
- Transactions are dated
- Data can be kept in memory CSV?
- Probably makes sense to have a transaction class, and have that living inside an account class. 

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