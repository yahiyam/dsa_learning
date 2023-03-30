class Node {
  int data;
  Node? next;
  Node? prev;
  Node({required this.data});
}

class DLinkedList {
  Node? head, tail;

  addNode(int data) {
    Node newNode = Node(data: data);
    if (head == null) {
      head = newNode;
    } else {
      tail?.next = newNode;
      newNode.prev = tail;
    }
    tail = newNode;
  }

  displayNode() {
    if (head == null) {
      print('nothing here');
      return;
    }
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  displayNodeReverse() {
    if (head == null) {
      print('nothing here');
      return;
    }
    Node? temp = tail;
    while (temp != null) {
      print(temp.data);
      temp = temp.prev;
    }
  }

  deleteByData(int data) {
    Node? temp = head; // , prev;
    if (temp != null && temp.data == data) {
      head = temp.next;
      temp.next?.prev = null;
      return;
    }
    while (temp != null && temp.data != data) {
      // prev = temp;
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    if (temp == tail) {
      // tail = prev;
      tail = temp.prev;
      tail?.next = null;
      return;
    }
    temp.prev!.next = temp.next;
    temp.next!.prev = temp.prev;
    // prev?.next = temp.next;
  }

  insertBefore(int before, int data) {
    Node? newNode = Node(data: data);
    Node? temp = head;
    while (temp != null && temp.data != before) {
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    if (temp == head) {
      temp.prev = newNode;
      newNode.next = temp; //
      head = newNode;
      return;
    }
    newNode.prev = temp.prev;
    newNode.next = temp; //
    temp.prev!.next = newNode; //
    temp.prev = newNode;
  }

  insertAfter(int after, int data) {
    Node? newNode = Node(data: data);
    Node? temp = head;
    while (temp != null && temp.data != after) {
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    if (temp == tail) {
      temp.next = newNode;
      newNode.prev = temp;
      tail = newNode;
      return;
    }
    newNode.next = temp.next;
    newNode.prev = temp;
    temp.next!.prev = newNode;
    temp.next = newNode;
  }
}

void main(List<String> args) {
  DLinkedList dll = DLinkedList();
  dll.addNode(10);
  dll.addNode(20);
  dll.addNode(30);
  dll.addNode(40);
  dll.insertAfter(20, 25);
  dll.insertBefore(20, 15);
  dll.deleteByData(10);
  dll.deleteByData(25);
  dll.displayNodeReverse();
}
