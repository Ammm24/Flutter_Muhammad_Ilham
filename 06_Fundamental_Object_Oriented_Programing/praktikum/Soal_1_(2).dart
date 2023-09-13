class Mobil {
  String nama;
  double berat;

  String property;
  double kapasitas;

  Mobil({
    required this.nama,
    required this.berat,
    required this.property,
    required this.kapasitas,
  });
}

void main() {
  // Buat objek Mobil
  Mobil mobil = Mobil(
    nama: "Toyota Avanza",
    berat: 1.300,
    property: "MPV",
    kapasitas: 7,
  );

  // Cetak nama, berat, property, dan kapasitas mobil
  print("Nama mobil: ${mobil.nama}");
  print("Berat mobil: ${mobil.berat} kg");
  print("Property mobil: ${mobil.property}");
  print("Kapasitas mobil: ${mobil.kapasitas} orang");
}
