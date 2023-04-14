class MinHeap {
  late List<int> heap;

  MinHeap.fromList(List<int> array) {
    buildHeap(array);
  }

  void buildHeap(List<int> array) {
    heap = List.from(array);
    for (int i = parent(heap.length - 1); i >= 0; i--) {
      shiftDown(i);
    }
  }

  void shiftDown(int currentIdx) {
    int endIdx = heap.length - 1;
    int leftIdx = leftChild(currentIdx);
    while (leftIdx <= endIdx) {
      int rightIdx = rightChild(currentIdx);
      int idxToShift;
      if (rightIdx <= endIdx && heap[rightIdx] < heap[leftIdx]) {
        idxToShift = rightIdx;
      } else {
        idxToShift = leftIdx;
      }
      if (heap[currentIdx] > heap[idxToShift]) {
        _swap(currentIdx, idxToShift);
        currentIdx = idxToShift;
        leftIdx = leftChild(currentIdx);
      } else {
        return;
      }
    }
  }

  void shiftUp(int currentIdx) {
    int parentIdx = parent(currentIdx);
    while (currentIdx > 0 && heap[parentIdx] > heap[currentIdx]) {
      _swap(currentIdx, parentIdx);
      currentIdx = parentIdx;
      parentIdx = parent(currentIdx);
    }
  }

  int peek() {
    return heap[0];
  }

  void remove() {
    _swap(0, heap.length - 1);
    heap.removeLast();
    shiftDown(0);
  }

  void insert(int value) {
    heap.add(value);
    shiftUp(heap.length - 1);
  }

  int parent(int i) {
    return (i - 1) ~/ 2;
  }

  int leftChild(int i) {
    return (i * 2) + 1;
  }

  int rightChild(int i) {
    return (i * 2) + 2;
  }

  void display() {
    for (int i = 0; i < heap.length; i++) {
      print(heap[i]);
    }
  }

  void _swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }
}

void main() {
  List<int> array = [6, 2, 8];
  MinHeap heap = MinHeap.fromList(array);
  heap.display();
  print('object');
  heap.insert(1);
  heap.insert(5);
  heap.insert(15);
  heap.display();
  print('object');
  heap.remove();
  heap.display();
}
