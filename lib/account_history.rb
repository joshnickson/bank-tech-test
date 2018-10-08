class AccountHistory
  attr_reader :history
  def initialize
    @history = []
  end

  def log_deposit(amount, balance)
    @history << {
      date: Time.now.strftime('%d-%m-%y'),
      credit: amount,
      balance: balance
    }
  end

  def log_withdrawal(amount, balance)
    @history << {
      date: Time.now.strftime('%d-%m-%y'),
      debit: amount,
      balance: balance
    }
  end

  def show_statement
    ['date || credit || debit || balance'] +
      @history.map do |item|
        [
          item[:date],
          item[:credit],
          item[:debit],
          item[:balance]
        ].join(' || ')
      end
  end
end
