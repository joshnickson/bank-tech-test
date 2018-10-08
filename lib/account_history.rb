class AccountHistory
  attr_reader :history
  def initialize
    @history = []
  end

  def log_deposit(amount, balance)
    log_default(balance)
    @history.last[:credit] = amount
  end

  def log_withdrawal(amount, balance)
    log_default(balance)
    @history.last[:debit] = amount
  end

  def show_statement
    ['date || credit || debit || balance'] +
      @history.reverse.map do |item|
        [
          item[:date],
          print_float(item[:credit]),
          print_float(item[:debit]),
          print_float(item[:balance])
        ].join(' || ')
      end
  end

  private

  def log_default(balance)
    @history << {
      date: Time.now.strftime('%d-%m-%y'),
      balance: balance
    }
  end

  def print_float(value)
    format('%.2f', value) unless value.nil?
  end
end
