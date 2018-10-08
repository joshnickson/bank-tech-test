require 'account'

describe Account do
  let(:account) { described_class.new }

  describe 'Deposit funds' do
    it 'allows user to deposit funds' do
      expect { account.deposit(100) }.to change { account.balance }.by(100)
    end
  end

  describe 'Withdraw funds' do
    it 'allows user to withdraw funds' do
      expect { account.withdraw(100) }.to change { account.balance }.by(-100)
    end
  end

end
