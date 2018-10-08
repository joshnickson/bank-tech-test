require 'account'

describe Account do
  let(:account) { described_class.new }

  describe 'Deposit funds' do
    it 'allows user to deposit funds' do
      account.deposit(1000)
    end
  end

end
