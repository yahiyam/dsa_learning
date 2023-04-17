heapSort(List list) {
  for (int i = list.length - 1 ~/ 2; i >= 0; i--) {
    heapify(list, list.length, i);
  }

  for (int i = list.length - 1; i > 0; i--) {
    swap(list, 0, i);
    heapify(list, i, 0);
  }
}

heapify(List list, int n, int i) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < n && list[left] > list[largest]) {
    largest = left;
  }

  if (right < n && list[right] > list[largest]) {
    largest = right;
  }

  if (largest != i) {
    swap(list, i, largest);
    heapify(list, n, largest);
  }
}

swap(List list, int i, int j) {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}

main() {
  List list = [12, 11, 13, 5, 6, 7];
  heapSort(list);
  print(list); // Output: [5, 6, 7, 11, 12, 13]
}
