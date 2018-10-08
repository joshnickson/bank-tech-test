require 'account'
require 'account_history'

describe 'Account feature tests' do
  let(:account_history) { AccountHistory.new }
  let(:account) { Account.new(account_history) }

  it 'allows user to deposit funds' do
    account.deposit(1000)
    expect(account.balance).to eq(1000)
  end
  it 'allows user to withdraw funds' do
    account.withdraw(1000)
    expect(account.balance).to eq(-1000)
  end
  it 'stores a history of user actions' do
    account.deposit(1000)
    account.withdraw(800)
    expect(account_history.history.length).to eq(2)
    expect(account_history.history.first[:credit]).to eq(1000)
    expect(account_history.history.last[:debit]).to eq(800)
    expect(account.balance).to eq(200)
  end
end
