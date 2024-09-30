class Bankaccount {
  double _saldo;

  Bankaccount({required double saldoAwal}) : _saldo = saldoAwal;

  void setor(double jumlah) {
    _saldo += jumlah;
  }

  void tarik(double jumlah) {
    if (jumlah > _saldo) {
      print('Saldo tidak cukup!');
    } else {
      _saldo -= jumlah;
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
  }
}

void main() {
  Bankaccount rekening1 = Bankaccount(saldoAwal: 1200);
  print("Rekening 1 saldo (bank) ");
  rekening1.setor(500);
  print('Saldo: ${rekening1.cekSaldo()}');
  rekening1.tarik(200);
  print('Saldo setelah tarik: ${rekening1.cekSaldo()}');

  Savingaccount rekening2 = Savingaccount(saldoAwal: 2500, bunga: 5);
  print("\n");
  print("Rekening 2 saldo (tabungan) ");
  rekening2.setor(1000);
  print('Saldo: ${rekening2.cekSaldo()}');
  rekening2.tambahBunga();
  print('Saldo setelah bunga: ${rekening2.cekSaldo()}');
  
}