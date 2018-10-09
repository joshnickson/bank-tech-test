module StatementPrinter
  def self.print_statement(history)
    ['date || credit || debit || balance'] +
      history.reverse.map do |item|
        [
          item[:date],
          print_float(item[:credit]),
          print_float(item[:debit]),
          print_float(item[:balance])
        ].join(' || ')
      end
  end

  def self.print_float(value)
    format('%.2f', value) unless value.nil?
  end
  private_class_method :print_float
end