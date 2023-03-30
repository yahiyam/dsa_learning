//factorial
// by for loop
f1(int num) {
  int k = 1;
  for (int i = 2; i <= num; i++) {
    k = k * i;
  }
  return k;
}

// by recursion
f2(int num) {
  if (num < 2) {
    return 1;
  }
  return num * f2(num - 1);
}

void main(List<String> args) {
  print(f1(5));
  print(f2(5));
}
