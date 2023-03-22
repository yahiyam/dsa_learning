import 'dart:collection';

void main(List<String> args) {
  List list = [6, 5, 7, 9, 4, 0, 2];
  print(twoNumSumCheckingMethod1(list, 10)); //O(n*n)T,O(1)S
  print(twoNumSumCheckingMethod2(list, 10)); //O(n)T,O(n)S
}

twoNumSumCheckingMethod1(List list, int target) {
  for (var i = 0; i < list.length - 1; i++) {
    for (var j = i + 1; j < list.length; j++) {
      if (list[i] + list[j] == target) {
        return '${list[i]} and ${list[j]}';
      }
    }
  }
  return 'nothing found';
}

twoNumSumCheckingMethod2(List list, int target) {
  Set nums = HashSet(); //O(1)T
  for (var i = 0; i < list.length; i++) {
    int num = list[i];
    int match = target - num;
    if (nums.contains(match)) {
      return '$num and $match';
    } else {
      nums.add(num);
    }
  }
  return 'nothing found';
}
