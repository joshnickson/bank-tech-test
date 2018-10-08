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
end
