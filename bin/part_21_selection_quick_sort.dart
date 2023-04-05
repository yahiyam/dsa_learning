selectionSort(List list) {
  // One by one move boundary of unsorted subarray
  for (int i = 0; i < list.length - 1; i++) {
    // Find the minimum element in unsorted array
    int minIdx = i;
    for (int j = i + 1; j < list.length; j++) {
      if (list[j] < list[minIdx]) {
        minIdx = j;
      }
    }
    // Swap the found minimum element with the first element
    int temp = list[minIdx];
    list[minIdx] = list[i];
    list[i] = temp;
  }
  return list;
}
//code not working 
quickSort(List list) {
  quickSortHelper(list, 0, list.length - 1);
}

quickSortHelper(List list, int startIdx, int endIdx) {
  if (startIdx >= endIdx) {
    return;
  }
  int pivotIdx = startIdx, leftIdx = startIdx + 1, rightIdx = endIdx;
  while (leftIdx <= rightIdx) {
    if (list[leftIdx] > list[pivotIdx] && list[rightIdx] < list[pivotIdx]) {
      _swap(list, leftIdx, rightIdx);
      leftIdx++;
      rightIdx--;
    }
    if (list[leftIdx] <= list[pivotIdx]) {
      leftIdx++;
    }
    if (list[rightIdx] >= list[pivotIdx]) {
      rightIdx--;
    }
  }
  _swap(list, rightIdx, pivotIdx);
  quickSortHelper(list, startIdx, rightIdx - 1);
  quickSortHelper(list, rightIdx + 1, endIdx);
}

_swap(List list, int i, int j) {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}

void main(List<String> args) {
  List list = [2, 46, 2, 4, 9, 3, 2, 1, 9, 540];
  print(quickSort(list));
}
