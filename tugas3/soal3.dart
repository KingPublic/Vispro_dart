class ATM {
  double _balance;

  ATM({required double initialBalance}) : _balance = initialBalance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposit successful. New balance: $_balance');
    } else {
      print('Invalid deposit amount. Please try again.');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('Withdrawal successful. New balance: $_balance');
    } else if (amount > _balance) {
      print('Insufficient balance, your withdraw $amount, your balance is $_balance. Please try again.');
    } else {
      print('Invalid withdrawal amount. Please try again.');
    }
  }

  void checkBalance() {
    print('Current balance: $_balance');
    
  }
}

void main() {
  ATM atm = ATM(initialBalance: 1000);
  atm.checkBalance();
  atm.deposit(500);
  atm.checkBalance();
  atm.withdraw(200);
  atm.checkBalance();
  atm.withdraw(2000);
}