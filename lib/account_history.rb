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
    
    def print_float(value)
      '%.2f' % value unless value == nil
    end
end


