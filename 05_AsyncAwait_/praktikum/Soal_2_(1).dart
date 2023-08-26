void main() {
  List<List<int>> tempatList = [
    [1, 10],
    [2, 20],
    [3, 30],
    [4, 40]
  ];

  Map<int, int> tempatMap = {};

  for (var item in tempatList) {
    if (item.length == 2) {
      tempatMap[item[0]] = item[1];
    }
  }

  print("List: $tempatList");
  print("Map: $tempatMap");
}
