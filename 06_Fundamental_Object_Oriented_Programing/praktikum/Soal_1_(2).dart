class Mobil {
  String merk;
  String model;
  double beratKosong;
  List<Muatan> muatan;

  Mobil({required this.merk, required this.model, required this.beratKosong});

  // Method untuk menghitung total muatan
  double totalMuatan() {
    double total = 0;
    for (Muatan muatan in muatan) {
      total += muatan.berat;
    }
    return total;
  }
}

class Muatan {
  double berat;

  Muatan({required this.berat});
}

void main() {
  // Membuat objek Mobil
  Mobil mobil =
      Mobil(merk: "Toyota", model: "Kijang Innova", beratKosong: 1.500);

  // Menambahkan muatan
  mobil.muatan.add(Muatan(berat: 100));
  mobil.muatan.add(Muatan(berat: 200));

  // Mencetak total muatan
  print("Total muatan: ${mobil.totalMuatan()} kg");
}
