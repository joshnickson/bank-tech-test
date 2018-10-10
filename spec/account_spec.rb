require 'account'
describe Account do
  let(:history) do
    double :history,
           log_deposit: nil,
           log_withdrawal: nil,
           show_statement: 'statement'
  end
  let(:account) { described_class.new(history) }

  describe '#deposit' do
    it 'adds amount to balance' do
      expect { account.deposit(100) }
        .to change { account.balance }.by(100)
    end
    it 'throws error if amount less that zero' do
      expect { account.deposit(-100) }
        .to raise_error('Amount must be greater than zero')
    end
    it 'throws error if amount not a number' do
      expect { account.deposit('100') }
        .to raise_error('Please enter a valid amount')
    end
  end

  describe '#withdraw' do
    it 'deducts amount to balance' do
      account.deposit(100)
      expect { account.withdraw(100) }
        .to change { account.balance }.by(-100)
    end
    it 'throws error if amount less that zero' do
      expect { account.withdraw(-100) }
        .to raise_error('Amount must be greater than zero')
    end
    it 'throws error if amount not a number' do
      expect { account.withdraw('100') }
        .to raise_error('Please enter a valid amount')
    end
  end

  describe '#view_statement' do
    it 'prints bank statement to the console' do
      expect { account.view_statement }
        .to output("statement\n").to_stdout
    end
  end
end
