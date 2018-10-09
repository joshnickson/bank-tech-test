require 'account'
require 'account_history'

describe 'Bank feature tests' do
  let(:account) { Account.new }
  let(:account_history) { account.account_history }

  it 'allows user to deposit funds' do
    account.deposit(1000)
    expect(account.balance).to eq(1000)
  end
  it 'allows user to withdraw funds' do
    account.deposit(1000)
    account.withdraw(1000)
    expect(account.balance).to eq(0)
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
                "01-01-2001 ||  || 800.00 || 200.00\n"\
                "01-01-2001 || 1000.00 ||  || 1000.00\n"
    expect { account.view_statement }.to output(statement).to_stdout
  end
  it 'throws error if user tries to deposit invalid amount' do
    expect { account.deposit(-5) }
      .to raise_error('Amount must be greater than zero')
    expect(account_history.history.empty?).to eq(true)
  end
  it 'throws error if user tries to withdraw invalid amount' do
    expect { account.withdraw(-10) }
      .to raise_error('Amount must be greater than zero')
    expect(account_history.history.empty?).to eq(true)
  end
  it 'throws error if user has insufficient funds' do
    account.deposit(100)
    expect { account.withdraw(101) }
      .to raise_error('Insufficient funds')
  end
end
