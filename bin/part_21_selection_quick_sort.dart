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

quikSort(List list){

}
void main(List<String> args) {
  List list = [2, 46, 2, 4, 9, 3, 2, 1, 9, 540];
  print(selectionSort(list));
}
