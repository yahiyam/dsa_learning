main() {
  List<int> list = [9, 0, 6, 1, 9, 9, 5, 2, 7, 4];
  print(linearSearch(list, 10));
  print(linearSearch(list, 9));
  print(linearSearch(list, 0));
  list.sort();
  print(list);
  print(binarySearch(list, 10));
  print(binarySearch(list, 9));
  print(binarySearch(list, 0));
  print(binarySearch(list, 5));
  //if there is a repetation you only get first index of target in both searches for these code
}

String linearSearch(List<int> list, int target) {
  //time complexity for the linear search is O(n)
  for (int i = 0; i < list.length; i++) {
    if (list[i] == target) {
      return "$target found @ position ${i + 1}";
    }
  }
  return "$target not found";
}

String binarySearch(List<int> list, int target) {
  //time complexity for the binary search is O(logn)
  //list should be sorted in bineary search
  int min = 0;
  int max = list.length - 1;
  while (min <= max) {
    int mid = ((min + max) / 2).floor();
    if (list[mid] == target) {
      return "$target found @ position ${mid + 1}";
    } else if (target < list[mid]) {
      max = mid - 1;
    } else {
      min = mid + 1;
    }
  }
  return "$target not found";
}