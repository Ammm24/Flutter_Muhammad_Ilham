class Hewan {
  String nama;
  double berat;

  Hewan({required this.nama, required this.berat});
}

void main() {
  // Buat objek Hewan
  Hewan hewan = Hewan(nama: "Kucing", berat: 5.0);

  // Cetak nama dan berat hewan
  print("Nama hewan: ${hewan.nama}");
  print("Berat hewan: ${hewan.berat} kg");
}
