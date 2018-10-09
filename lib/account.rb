class Account
  attr_reader :balance, :account_history
  def initialize(history = AccountHistory.new)
    @balance = 0
    @account_history = history
  end

  def deposit(amount)
    check_valid(amount)
    @balance += amount
    @account_history.log_deposit(amount, @balance)
  end

  def withdraw(amount)
    check_valid(amount)
    check_funds(amount)
    @balance -= amount
    @account_history.log_withdrawal(amount, @balance)
  end

  def view_statement
    puts @account_history.show_statement
  end

  private

  def check_valid(amount)
    raise 'Please enter a valid amount' unless amount.is_a? Numeric
    raise 'Amount must be greater than zero' if amount <= 0
  end

  def check_funds(amount)
    raise 'Insufficient funds' if @balance - amount < 0
  end
end
