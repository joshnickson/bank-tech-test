require 'account'

describe 'Withdrawal feature tests' do
  let(:account) { Account.new }
  let(:account_history) { account.account_history }

  it 'allows user to withdraw funds' do
    account.deposit(1000)
    account.withdraw(1000)
    expect(account.balance).to eq(0)
  end
  it 'throws error if user tries to withdraw invalid amount' do
    expect { account.withdraw(-10) }
      .to raise_error('Amount must be greater than zero')
  end
  it 'throws error if user has insufficient funds' do
    account.deposit(100)
    expect { account.withdraw(101) }
      .to raise_error('Insufficient funds')
  end
end
