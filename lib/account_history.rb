require_relative 'printer'

class AccountHistory
  def initialize(printer = StatementPrinter)
    @history = []
    @printer = printer
  end

  def log_deposit(amount, balance)
    @history << {
      date: current_date,
      balance: balance,
      credit: amount
    }
  end

  def log_withdrawal(amount, balance)
    @history << {
      date: current_date,
      balance: balance,
      debit: amount
    }
  end

  def show_statement
    @printer.print_statement(@history)
  end

  private

  def current_date
    Time.now.strftime('%d-%m-%Y')
  end
end
