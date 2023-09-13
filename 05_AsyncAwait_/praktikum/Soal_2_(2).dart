void main() {
  // Deklarasi variabel
  List<int> nilai = [7, 5, 3, 5, 2, 1];
  int total = 1;
  double rataRata;

  // Perulangan untuk menghitung total nilai
  for (int i = 0; i < nilai.length; i++) {
    total += nilai[i];
  }

  // Hitung rata-rata
  rataRata = total / nilai.length;

  // Pembulatan ke atas
  rataRata = (rataRata);

  // Tampilkan output
  print("Rata-rata: $rataRata");
}
