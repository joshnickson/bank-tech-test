require 'account_history'
require 'timecop'

describe AccountHistory do
  let(:account_history) { described_class.new }
  before { Timecop.freeze(Time.local(2001)) }

  describe '#log_deposit' do
    it 'adds deposit information to history' do
      account_history.log_deposit(100, 200)
      expect(account_history.history.last.flatten)
        .to eq [:date, "01-01-01", :credit, 100, :balance, 200]
    end
  end

  describe '#log_withdrawal' do
    it 'adds withdrawal information to history' do
      account_history.log_withdrawal(100, 400)
      expect(account_history.history.last.flatten)
        .to eq [:date, "01-01-01", :debit, 100, :balance, 400]
    end
  end
end
