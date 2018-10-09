require 'account'

describe Account do
  let(:history) { double :history, log_deposit: nil, log_withdrawal: nil, show_statement: "statement" }
  let(:account) { described_class.new(history) }
  
  describe '#new' do
    it 'instantiates with balance of zero' do
      expect(account.balance).to eq 0
    end
    it 'instantiates with new instance of account history' do
      expect(account.account_history).to eq(history)
    end
  end

  describe '#deposit' do
    it 'adds amount to balance' do
      expect { account.deposit(100) }.to change { account.balance }.by(100)
    end
  end

  describe '#withdraw' do
    it 'deducts amount to balance' do
      account.deposit(100)
      expect { account.withdraw(100) }.to change { account.balance }.by(-100)
    end
  end

  describe '#view_statement' do
    it 'prints bank statement to the console' do
      expect { account.view_statement }.to output("statement\n").to_stdout 
    end
  end 
end
