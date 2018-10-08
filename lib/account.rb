class Account
  attr_reader :balance, :account_history
  def initialize(history)
    @balance = 0
    @account_history = history
  end

  def deposit(amount)
    @balance += amount
    @account_history.log_deposit(amount, @balance)
  end

  def withdraw(amount)
    @balance -= amount
    @account_history.log_withdrawal(amount, @balance)
  end

  def view_statement
    puts @account_history.show_statement
  end
end
