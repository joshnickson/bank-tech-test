require 'account'

describe Account do
  let(:account) { described_class.new }

  describe '#deposit' do
    it 'adds amount to balance' do
      expect { account.deposit(100) }.to change { account.balance }.by(100)
    end
  end

  describe '#withdraw' do
    it 'deducts amount to balance' do
      expect { account.withdraw(100) }.to change { account.balance }.by(-100)
    end
  end

end
