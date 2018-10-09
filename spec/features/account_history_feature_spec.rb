require 'account'

describe 'Withdrawal feature tests' do
  let(:account) { Account.new }
  let(:account_history) { account.account_history }

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
                "01-01-2001 ||  || 800.00 || 200.00\n"\
                "01-01-2001 || 1000.00 ||  || 1000.00\n"
    expect { account.view_statement }.to output(statement).to_stdout
  end
end