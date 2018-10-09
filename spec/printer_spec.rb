require 'printer'

describe StatementPrinter do
  history_data = [ 
    { :date=>"01-01-2001", :balance=>1000, :credit=>1000 }, 
    { :date=>"01-01-2001", :balance=>200, :debit=>800 }
  ]
  let(:history) { double :account_history, reverse: history_data }

  describe '#print_statement' do
    it 'returns bank statement in print-friendly format' do
      expected_output = [
        "date || credit || debit || balance",
        "01-01-2001 || 1000.00 ||  || 1000.00",
        "01-01-2001 ||  || 800.00 || 200.00"
      ]
      expect(subject.print_statement(history)).to eq(expected_output)
    end
  end
end
