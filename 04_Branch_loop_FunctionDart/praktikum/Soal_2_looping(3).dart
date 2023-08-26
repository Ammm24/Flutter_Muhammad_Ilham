void main() {
  List<int> angka = [10, 40, 50];

  for (int i = 0; i < angka.length; i++) {
    int hasilFaktorial = faktorial(angka[i]);
    print("Faktorial dari ${angka[i]} adalah $hasilFaktorial");
  }
}

int faktorial(int z) {
  if (z == 0 || z == 1) {
    return 1;
  } else {
    return z * faktorial(z - 1);
  }
}