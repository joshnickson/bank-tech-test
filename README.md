# Bank Tech Test
```
____________________________________
|#######=====================#######|
|#(1)*****BANK OF TECH TEST****(1) #|
|#**          /===\   ********   **#|
|*# {G}      | (") |              #*|
|#*  ******  | /v\ |    O N E     *#|
|#(1)         \===/             (1)#|
|##==ONE ARBITRARY MONETARY UNIT==##|
------------------------------------
```
Command line Ruby app that allows users to deposit and withdraw funds. Additionally, users can view a statement of their user history.

### How to Use
- Clone this repo to your machine
- Run `bundle install` to install gem dependencies
- In your terminal run `ruby bank_test.rb` 
- You can now interact with the bank via the command line

**Example usage:**

Let's start by creating a new account.
```
> account = Account.new
=> #<Account:0x00007fe89011b770 @balance=0, @account_history=#<AccountHistory:0x00007fe89011b748 @history=[]>>
```

Great! Now let's see how much money is in the account.
```
> account.balance
  => 0
```

No money yet. Let's add some. 100 arbitrary currency units should be enough to start!
```
> account.deposit(1000)
  => 1000
```

Excellent. The account now contains some cash. Now let's withdraw some funds to buy lunch. Let's take out 500. This is London after all.
```
> account.withdraw(500)
  => 500
```

We now have dispensible funds to buy things. On second thoughts, 500 seems like too much cash to carry around. Let's deposit again and then view our statement to check that all of our acitivity was logged correctly.

```
> account.deposit(300)
  => 1000
> account.view_statement(300)
date || credit || debit || balance
09-10-2018 || 300.00 ||  || 800.00
09-10-2018 ||  || 500.00 || 500.00
09-10-2018 || 1000.00 ||  || 1000.00
  => nil
```

Great! Just as we expected. 

### Domain Model


### Testing

The app was developed test-first with feature tests and unit tests using RSpec. Using the RED-GREEN-REFACTOR process, I implemented features incrementally using the user stories as a guide to implement the minimum functionality to satisfy the project requirements.

**Plus!**

- `simplecov` gem used to show test coverage (100%)
- `rubopcop` linter gem used to ensure consistant code formatting helping with readabilty


### User Stories

```
As a client
So that I don't have to keep wads of cash uder my matress
I would like to deposit money into my bank

As a client
So that I can spend my money
I would like to withdraw money from the bank

As a client
So that I can be reminded of how little money I have
I would like to be able to see how much money I currently have

As a client
So that I can keep on track of my finances
I would like to view a bank statement in reverse chronological order
```

