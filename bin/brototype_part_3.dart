void main(List<String> args) {
  List a = [1, 2, 3, 4, 5];
  print(f1(a)); //O(n)T
  print(f2(a)); //O(1)T
  print(f3(a)); //O(n^2)

  print(f4(5)); //O(1)T ==> this fn is prefered
  print(f5(5)); //O(n)T
  print(f6(a)); //O(n)T,O(1)S
}

f1(List list) {
  num sum = 0;
  for (var i = 0; i < list.length; i++) {
    sum = sum + list[i];
  }
  return sum;
}

f2(List list) {
  return list.first;
}

f3(List list) {
  List<dynamic> result = [];
  for (var i = 0; i < list.length; i++) {
    for (var j = 0; j < list.length; j++) {
      int value = list[i] + list[j];
      result.add(value);
    }
  }
  return result;
}

f4(int n) {
  int sum = 0;
  sum = (n * (n + 1) / 2).floor();
  return sum;
}

f5(int n) {
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    sum += i;
  }
  return sum;
}

f6(List list) {
  int temp = 0;
  for (var i = 0; i < list.length; i++) {
    temp = list[i];
  }
  return temp;
}

//there is no use in calculate time in ms for each line,bcz list length may varries and depents on OS
// we are looking for growth rate according to input
/* 
linear time complexity  O(n)    eg;f1
constant TC             O(1)    eg;f2
quadratic TC            O(n^2)  eg;f3
*/
