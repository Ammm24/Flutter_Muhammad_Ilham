void main() {
  int tinggiJamPasir = 6;  
  // Bagian atas 
  for (int i = 0; i < tinggiJamPasir; i++) {
    print(' ' * i + '*' * (2 * (tinggiJamPasir - i) - 1));
  }

  // Bagian bawah
  for (int i = 1; i < tinggiJamPasir; i++) {
    print(' ' * (tinggiJamPasir - i - 1) + '*' * (2 * i + 1));
  }
}