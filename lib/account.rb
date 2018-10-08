class Account
  attr_reader :balance, :history
  def initialize
    @balance = 0
    @history = []
  end

  def deposit(amount)
    @balance += amount
    @history << { credit: amount, balance: @balance }
  end

  def withdraw(amount)
    @balance -= amount
    @history << { debit: amount, balance: @balance }
  end
end
