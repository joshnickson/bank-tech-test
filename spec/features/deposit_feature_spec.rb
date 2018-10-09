require 'account'

describe 'Withdrawal feature tests' do
  let(:account) { Account.new }
  let(:account_history) { account.account_history }

  it 'allows user to deposit funds' do
    account.deposit(1000)
    expect(account.balance).to eq(1000)
  end
  it 'throws error if user tries to deposit invalid amount' do
    expect { account.deposit(-5) }
      .to raise_error('Amount must be greater than zero')
    expect(account_history.history.empty?).to eq(true)
  end
end
