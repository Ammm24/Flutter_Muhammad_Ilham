void main() async {
  int input = 5;
  int hasilFaktorial = await hitungFaktorial(input);

  print("Input: $input");
  print("Output: $hasilFaktorial");
}

Future<int> hitungFaktorial(int n) async {
  if (n == 0 || n == 1) {
    return 1;
  } else {
    return n * await hitungFaktorial(n - 1);
  }
}