require 'account'
require 'account_history'

describe 'Bank feature tests' do
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
  end
  it 'shows a bank statement of user actions' do
    account.deposit(1000)
    account.withdraw(800)
    statement = "date || credit || debit || balance\n"\
                "08-10-18 ||  || 800 || 200\n"\
                "08-10-18 || 1000 ||  || 1000\n"\
                
    expect { account.view_statement }.to output(statement).to_stdout
  end
end
