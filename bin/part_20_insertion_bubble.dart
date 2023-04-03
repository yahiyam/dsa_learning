insertionSort(List list) {
  for (int i = 1; i < list.length; i++) {
    int current = list[i];
    int j = i - 1;
    while (j >= 0 && current < list[j]) {
      list[j + 1] = list[j];
      j = --j;
    }
    list[j + 1] = current;
  }
  return list;
}

bubbleSort(List list) {
  for (var i = 0; i < list.length - 1; i++) {
    for (var j = i + 1; j < list.length; j++) {
      if (list[i] > list[j]) {
        int temp = list[i];
        list[i] = list[j];
        list[j] = temp;
      }
    }
  }
  return list;
}

void main(List<String> args) {
  List list = [30, 2, 41, 56, 12, 11, 22, 41];
  // List insertion = insertionSort(list);
  // print(insertion);
  List bubble = bubbleSort(list);
  print(bubble);
}
