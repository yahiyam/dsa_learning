void heapSort(List<int> arr) {
  // Build a max heap from the array
  for (int i = arr.length ~/ 2 - 1; i >= 0; i--) {
    heapify(arr, arr.length, i);
  }

  // Extract elements from the heap in max order and put them at the end of the array
  for (int i = arr.length - 1; i > 0; i--) {
    swap(arr, 0, i);
    heapify(arr, i, 0);
  }
}

void heapify(List<int> arr, int n, int i) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  // Check if left child is larger than root
  if (left < n && arr[left] > arr[largest]) {
    largest = left;
  }

  // Check if right child is larger than largest so far
  if (right < n && arr[right] > arr[largest]) {
    largest = right;
  }

  // If largest is not root, swap with root and heapify the affected sub-tree
  if (largest != i) {
    swap(arr, i, largest);
    heapify(arr, n, largest);
  }
}

void swap(List<int> arr, int i, int j) {
  int temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}

void main() {
  List<int> arr = [12, 11, 13, 5, 6, 7];
  heapSort(arr);
  print(arr); // Output: [5, 6, 7, 11, 12, 13]
}
