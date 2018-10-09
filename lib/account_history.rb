require_relative 'printer'

class AccountHistory
  attr_reader :history
  def initialize(printer = StatementPrinter)
    @history = []
    @printer = printer
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
    @printer.print_statement(@history)
  end

  private

  def log_default(balance)
    @history << {
      date: Time.now.strftime('%d-%m-%Y'),
      balance: balance
    }
  end
end
