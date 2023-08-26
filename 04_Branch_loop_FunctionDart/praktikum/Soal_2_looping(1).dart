void main() {
  int tinggiPiramida = 10;

  for (int i = 1; i <= tinggiPiramida; i++) {
    print(' ' * (tinggiPiramida - i) + '*' * (2 * i - 1));
  }
}