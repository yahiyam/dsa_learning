void quickSort(List arr, int low, int high) {
  if (low < high) {
    int partitionIndex = partition(arr, low, high);
    quickSort(arr, low, partitionIndex - 1);
    quickSort(arr, partitionIndex + 1, high);
  }
}

int partition(List arr, int low, int high) {
  int pivot = arr[high];
  int i = low - 1;
  for (int j = low; j < high; j++) {
    if (arr[j] <= pivot) {
      i++;
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }
  int temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;
  return i + 1;
}

void main() {
  List arr = [7, 6, 10, 5, 9, 2, 1, 15, 7];
  // List<int> arr = [32, 41, 16, 21, 62, 4, 25, 11];
  quickSort(arr, 0, arr.length - 1);
  print(arr); // [1, 2, 5, 6, 7, 7, 9, 10, 15]
}
