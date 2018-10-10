require 'account_history'

describe AccountHistory do
  let(:printer) { double :printer, print_statement: 'statement' }
  let(:account_history) { described_class.new(printer) }

  describe '#log_deposit' do
    it 'adds deposit information to history' do
      expect(account_history.log_deposit(100, 200).last.flatten)
        .to eq [:date, '01-01-2001', :balance, 200, :credit, 100]
    end
  end

  describe '#log_withdrawal' do
    it 'adds withdrawal information to history' do
      expect(account_history.log_withdrawal(100, 400).last.flatten)
        .to eq [:date, '01-01-2001', :balance, 400, :debit, 100]
    end
  end

  describe '#show_statement' do
    it 'returns bank statement from printer module' do
      expect(account_history.show_statement).to eq('statement')
    end
  end
end
