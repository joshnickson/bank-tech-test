require 'account'

describe 'Withdrawal feature tests' do
  let(:account) { Account.new }

  it 'shows a bank statement of user actions' do
    account.deposit(1000)
    account.withdraw(800)
    statement = "date || credit || debit || balance\n"\
                "01-01-2001 ||  || 800.00 || 200.00\n"\
                "01-01-2001 || 1000.00 ||  || 1000.00\n"
    expect { account.view_statement }.to output(statement).to_stdout
  end
end
