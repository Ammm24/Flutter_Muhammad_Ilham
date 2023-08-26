Future<List<int>> multiplyList(List<int> data, int multiplier) async {
  List<int> result = [];

  await Future.forEach(data, (element) async {
    await Future.delayed(Duration(milliseconds: 10));  // Simulasi operasi asynchronous
    result.add(element * multiplier);
  });

  return result;
}

void main() async {
  List<int> data = [1, 2, 3, 4, 5];
  int pengali = 2;

  List<int> hasil = await multiplyList(data, pengali);

  print("Data awal: $data");
  print("Hasil perkalian: $hasil");
}
