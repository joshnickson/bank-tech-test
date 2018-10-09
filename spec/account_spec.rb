require 'account'

describe Account do
  let(:history) { double :history, log_deposit: nil, log_withdrawal: nil }
  let(:account) { described_class.new(history) }

  describe '#deposit' do
    it 'adds amount to balance' do
      expect { account.deposit(100) }.to change { account.balance }.by(100)
    end
  end

  describe '#withdraw' do
    it 'deducts amount to balance' do
      account.deposit(100)
      expect { account.withdraw(100) }.to change { account.balance }.by(-100)
    end
  end
end
