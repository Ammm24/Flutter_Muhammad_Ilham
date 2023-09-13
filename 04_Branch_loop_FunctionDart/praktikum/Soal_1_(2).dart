void main() {
  for (int nilai = 1; nilai <= 10; nilai++) {
    String hasil = nilaiToGrade(nilai);
    print("Nilai $nilai: $hasil");
  }
}

String nilaiToGrade(int nilai) {
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40) {
    return "Nilai B";
  } else if (nilai > 0) {
    return "Nilai C";
  } else {
    return "";
  }
}