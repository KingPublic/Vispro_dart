
void main() {
  Siswa siswa1 = Siswa(nama: 'Andi Nisa', nim: 12345, nilai: 85);
  siswa1.tampilkanInfoSiswa();
  print('Telah lulus: ${siswa1.telahLulus()}');

  Siswa siswa2 = Siswa(nama: 'Budi Gono', nim: 67890, nilai: 60);
  siswa2.tampilkanInfoSiswa();
  print('Telah lulus: ${siswa2.telahLulus()}');
}

class Siswa {
  String nama;
  int nim;
  int nilai;

  Siswa({required this.nama, required this.nim, required this.nilai});

  void tampilkanInfoSiswa() {
    print("\n");
    print('Nama: $nama');
    print('NIM: $nim');
    print('Nilai: $nilai');
    
  }

  bool telahLulus() {
    return nilai >= 70;
  }
}