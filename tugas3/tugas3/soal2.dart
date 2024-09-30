import 'dart:io';

class Bankaccount {
  double _saldo;

  Bankaccount({required double saldoAwal}) : _saldo = saldoAwal;

  void setor(double jumlah) {
    if (jumlah >= 50000) {
      _saldo += jumlah;
      print('Deposit berhasil! Saldo sekarang: $_saldo');
    } else {
      print('Minimal deposit adalah 50000!');
    }
  }

  void tarik(double jumlah) {
    if (jumlah >= 50000) {
      if (jumlah > _saldo) {
        print('Saldo tidak cukup!');
      } else {
        _saldo -= jumlah;
        print('Penarikan berhasil! Saldo sekarang: $_saldo');
      }
    } else {
      print('Minimal penarikan adalah 50000!');
    }
  }

  double cekSaldo() {
    return _saldo;
  }
}

class Savingaccount extends Bankaccount {
  double _bunga;

  Savingaccount({required double saldoAwal, required double bunga})
      : _bunga = bunga,
        super(saldoAwal: saldoAwal);

  void tambahBunga() {
    _saldo += (_saldo * _bunga / 100);
    print('Bunga telah ditambahkan! Saldo sekarang: $_saldo');
  }
}

void main() {
  print('Pilih jenis rekening:');
  print('1. Rekening Bank');
  print('2. Rekening Tabungan');

  int pilihan = int.parse(stdin.readLineSync()!);

  if (pilihan == 1) {
    print('Masukkan saldo awal:');
    double saldoAwal = double.parse(stdin.readLineSync()!);

    Bankaccount rekening1 = Bankaccount(saldoAwal: saldoAwal);

    while (true) {
      print('Pilih operasi:');
      print('1. Deposit');
      print('2. Penarikan');
      print('3. Cek Saldo');
      print('4. Keluar');

      int operasi = int.parse(stdin.readLineSync()!);

      switch (operasi) {
        case 1:
          print('Masukkan jumlah deposit:');
          double deposit = double.parse(stdin.readLineSync()!);
          rekening1.setor(deposit);
          break;
        case 2:
          print('Masukkan jumlah penarikan:');
          double penarikan = double.parse(stdin.readLineSync()!);
          rekening1.tarik(penarikan);
          break;
        case 3:
          print('Saldo sekarang: ${rekening1.cekSaldo()}');
          break;
        case 4:
          print('Keluar...');
          return;
        default:
          print('Pilihan tidak valid!');
      }
    }
  } else if (pilihan == 2) {
    print('Masukkan saldo awal:');
    double saldoAwal = double.parse(stdin.readLineSync()!);
    print('Masukkan bunga:');
    double bunga = double.parse(stdin.readLineSync()!);

    Savingaccount rekening2 = Savingaccount(saldoAwal: saldoAwal, bunga: bunga);

    while (true) {
      print('Pilih operasi:');
      print('1. Deposit');
      print('2. Penarikan');
      print('3. Tambah Bunga');
      print('4. Cek Saldo');
      print('5. Keluar');

      int operasi = int.parse(stdin.readLineSync()!);

      switch (operasi) {
        case 1:
          print('Masukkan jumlah deposit:');
          double deposit = double.parse(stdin.readLineSync()!);
          rekening2.setor(deposit);
          break;
        case 2:
          print('Masukkan jumlah penarikan:');
          double penarikan = double.parse(stdin.readLineSync()!);
          rekening2.tarik(penarikan);
          break;
        case 3:
          rekening2.tambahBunga();
          break;
        case 4:
          print('Saldo sekarang: ${rekening2.cekSaldo()}');
          break;
        case 5:
          print('Keluar...');
          return;
        default:
          print('Pilihan tidak valid!');
      }
    }
  } else {
    print('Pilihan tidak valid!');
  }
}