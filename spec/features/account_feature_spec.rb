require 'account'

describe 'Account feature tests' do
  let(:account) { Account.new }

  it 'allows user to deposit funds' do
    account.deposit(1000)
    expect(account.balance).to eq(1000)
  end
  it 'allows user to withdraw funds' do
    account.withdraw(1000)
    expect(account.balance).to eq(-1000)
  end
end
