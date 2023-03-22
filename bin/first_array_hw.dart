// [6,1,6,8,10,4,15,6,3,9,6]
// [9,1,3,8,10,4,15,6,6,6,6]

//prize money answer
f(List list, int select) {
  int i = 0;
  int j = list.length - 1;

  while (i < j) {
    while (i < j && list[j] == select) {
      j--;
    }
    if (list[j] == select) {
      int temp = list[j];
      list[j] = list[i];
      list[i] = temp;
    }
    i++;
  }
  return "$list";
}

//from youtube comments
List<int> swapToEnd(List<int> list, int target) {
  for (int j = list.length - 1; j > 0; j--) {
    if (list[j] != target) {
      for (int i = 0; i < j; i++) {
        if (list[i] == target) {
          int temp = list[i];
          list[i] = list[j];
          list[j] = temp;
        }
      }
    }
  }
  return list;
}

// from youtube comments
result(List list,int target) {
  int j = list.length - 1;
  for (int i = 0; i < list.length; i++) {
    if (list[j] == target) {
      j--;
    }
    if (list[i] == target) {
      int swap = list[j];
      list[j] = list[i];
      list[i] = swap;
      j--;
    }
    if (i == j) {
      break;
    }
  }
  return list;
}

void main() {
  List<int> list = [6, 1, 6, 8, 10, 4, 15, 6, 3, 9, 6];
  int target = 6;
  print(swapToEnd(list, target)); //O(n*2)T,O(1)S
  print(result(list, target)); //O(n)T,O(1)S
}
