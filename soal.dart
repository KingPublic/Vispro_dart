import 'dart:io';
import 'dart:math';

// Fungsi utama
void main() {
  Stopwatch stopwatch = Stopwatch();
  List<int> angka = [];

  do {
    print("Masukkan jumlah angka yang ingin di-generate atau 'exit' untuk keluar:");
    String? input = stdin.readLineSync();

    if (input == 'exit') {
      print("Program selesai.");
      break;
    }

    int? n = int.tryParse(input ?? '');
    angka = n != null && n > 0 ? generateRandomNumbers(n) : angka;

    _processInput(angka, stopwatch, n);
  } while (true);
}
// Fungsi generate angka random
List<int> generateRandomNumbers(int n) {
  Random rand = Random();
  return List<int>.generate(n, (_) => rand.nextInt(100));
}

// Fungsi untuk memproses input
void _processInput(List<int> angka, Stopwatch stopwatch, int? n) {
  n != null ? print("Angka yang di-generate: $angka") : print("Input tidak valid. Masukkan angka positif.");
  n != null ? _chooseOperation(angka, stopwatch) : null;
}

// Fungsi untuk memilih operasi
void _chooseOperation(List<int> angka, Stopwatch stopwatch) {
  print("Pilih operasi yang ingin dilakukan:");
  print("1. Bubble Sort");
  print("2. Inversi");
  print("3. Shuffle");

  String? pilihan = stdin.readLineSync();
  int op = int.tryParse(pilihan ?? '') ?? 0;

  stopwatch.start();
  _executeOperation(op, angka);
  stopwatch.stop();

  print("Waktu eksekusi: ${stopwatch.elapsedMilliseconds} ms");
  stopwatch.reset();
}

// Fungsi untuk mengeksekusi operasi
void _executeOperation(int op, List<int> angka) {
  switch (op) {
    case 1:
      print("Hasil Bubble Sort: ${bubbleSort(angka)}");
      break;
    case 2:
      print("Jumlah inversi: ${invertList(angka)}");
      break;
    case 3:
      angka.shuffle();
      print("Hasil Shuffle: $angka");
      break;
    default:
      print("Operasi tidak valid.");
      break;
  }
}

// Recursive function to invert a list
List<int> invertList(List<int> list) {
  return list.isEmpty
    ? list
    : [list.last] + invertList(list.sublist(0, list.length - 1));
}

// Recursive function to swap two elements in a list
List<int> swap(List<int> list, int i) {
  return [
    ...list.sublist(0, i),
    list[i + 1],
    list[i],
    ...list.sublist(i + 2)
  ];
}

// Recursive function to perform a single pass of bubble sort
List<int> bubbleSortPass(List<int> list, int start) {
  try {
    return list[start] > list[start + 1]
      ? bubbleSortPass(swap(list, start), start + 1)
      : bubbleSortPass(list, start + 1);
  } catch (e) {
    return list;
  }
}

// Recursive function to perform the entire bubble sort
List<int> bubbleSort(List<int> list) {
  List<int> sortedList = bubbleSortPass(list, 0);
  return sortedList == list
    ? list
    : bubbleSort(sortedList);
}


