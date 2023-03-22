//non contigous linked list
//singly LL

class Node {
  int data;
  Node? next;
  Node({
    required this.data,
    this.next,
  });
}

class Bahubali {
  Node? head;
  Node? tail;

  void addNode(int data) {
    final newNode = Node(data: data);
    if (head == null) {
      head = newNode;
    } else {
      tail?.next = newNode;
    }
    tail = newNode;
  }

  void display() {
    if (head == null) {
      print("empty");
      return;
    }
    var temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  void delete(int data) {
    Node? temp = head;
    Node? prev;
    if (temp != null && temp.data == data) {
      head = temp.next;
      return;
    }
    while (temp != null && temp.data != data) {
      prev = temp;
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    if (temp == tail) {
      tail = prev;
      tail?.next = null;
      return;
    }
    prev?.next = temp.next;
  }

  void insertAfter(int nextTo, int data) {
    Node newNode = Node(data: data);
    Node? temp = head;
    while (temp != null && temp.data != nextTo) {
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    if (temp == tail) {
      tail?.next = newNode;
      tail = newNode;
      return;
    }
    newNode.next = temp.next;
    temp.next = newNode;
  }
}

void main() {
  Bahubali bahubali = Bahubali();
  bahubali.addNode(10);
  bahubali.addNode(10);
  bahubali.addNode(20);
  bahubali.addNode(30);
  bahubali.delete(10);
  // List list = [10, 20, 5, 64, 6874, 3];
  // for (var value in list) {
  //   bahubali.addNode(value);
  // }
  bahubali.insertAfter(20, 25);
  bahubali.display();
}
