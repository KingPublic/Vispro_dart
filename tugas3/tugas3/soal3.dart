import 'dart:io';

class ATM {
  double _balance;

  ATM({required double initialBalance}) : _balance = initialBalance;

  void deposit(double amount) {
    if (amount >= 50000) {
      _balance += amount;
      print('Deposit successful. New balance: $_balance');
    } else {
      print('Minimal deposit adalah 50000. Silakan coba lagi.');
    }
  }

  void withdraw(double amount) {
    if (amount >= 50000 && amount <= _balance) {
      _balance -= amount;
      print('Penarikan berhasil. Saldo sekarang: $_balance');
    } else if (amount > _balance) {
      print('Saldo tidak cukup, penarikan $amount, saldo Anda adalah $_balance. Silakan coba lagi.');
    } else {
      print('Minimal penarikan adalah 50000. Silakan coba lagi.');
    }
  }

  void checkBalance() {
    print('Saldo sekarang: $_balance');
  }
}

void main() {
  ATM atm = ATM(initialBalance: 1000000);
  atm.checkBalance();

  while (true) {
    print('Pilih operasi:');
    print('1. Deposit');
    print('2. Penarikan');
    print('3. Cek Saldo');
    print('4. Keluar');

    int pilihan = int.parse(stdin.readLineSync()!);

    switch (pilihan) {
      case 1:
        print('Masukkan jumlah deposit:');
        double deposit = double.parse(stdin.readLineSync()!);
        atm.deposit(deposit);
        break;
      case 2:
        print('Masukkan jumlah penarikan:');
        double penarikan = double.parse(stdin.readLineSync()!);
        atm.withdraw(penarikan);
        break;
      case 3:
        atm.checkBalance();
        break;
      case 4:
        print('Keluar...');
        return;
      default:
        print('Pilihan tidak valid!');
    }
  }
}