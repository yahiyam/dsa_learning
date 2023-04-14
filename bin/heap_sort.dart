heapSort(List list) {
  // Build a max heap from the list
  for (int i = list.length ~/ 2 - 1; i >= 0; i--) {
    heapify(list, list.length, i);
  }

  // Extract elements from the heap in max order and put them at the end of the list
  for (int i = list.length - 1; i > 0; i--) {
    swap(list, 0, i);
    heapify(list, i, 0);
  }
}

heapify(List list, int n, int i) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  // Check if left child is larger than root
  if (left < n && list[left] > list[largest]) {
    largest = left;
  }

  // Check if right child is larger than largest so far
  if (right < n && list[right] > list[largest]) {
    largest = right;
  }

  // If largest is not root, swap with root and heapify the affected sub-tree
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
