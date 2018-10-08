class AccountHistory
  attr_reader :history
  def initialize
    @history = []
  end

  def log_deposit(amount, balance)
    @history << { credit: amount, balance: balance }
  end

  def log_withdrawal(amount, balance)
    @history << { debit: amount, balance: balance }
  end
end
