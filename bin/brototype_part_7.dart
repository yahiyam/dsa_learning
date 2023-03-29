//non contigous linked list
//singly LL

class Node {
  int data;
  Node? next;
  Node({required this.data});
}

class SLinkedList {
  Node? head;
  Node? tail;
  addNode(int data) {
    Node newNode = Node(data: data);
    if (head == null) {
      head = newNode;
    } else {
      tail?.next = newNode;
    }
    tail = newNode;
  }

  displayNode() {
    if (head == null) {
      print('nothing here');
      return;
    }
    Node? temp;
    temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

//from apna college
  addFirst(int data) {
    Node newNode = Node(data: data);
    if (head == null) {
      head = newNode;
      return;
    }
    newNode.next = head;
    head = newNode;
  }

//from apna college
  addLast(int data) {
    Node newNode = Node(data: data);
    if (head == null) {
      head = newNode;
      return;
    }
    Node? currNode = head;
    while (currNode?.next != null) {
      currNode = currNode?.next;
    }
    currNode?.next = newNode;
    //only needed if you have tail
    tail = newNode;
  }

//from apna college
  deleteFirst() {
    if (head == null) {
      print("Nothing found here");
      return;
    }
    head = head?.next;
  }

  deleteByData(int data) {
    Node? temp = head, prev;
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

  insertAfter(int after, int data) {
    Node newNode = Node(data: data);
    Node? temp = head;
    while (temp != null && temp.data != after) {
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    if (temp == tail) {
      temp.next = newNode;
      tail = newNode;
      return;
    }
    newNode.next = temp.next;
    temp.next = newNode;
  }
}

void main() {
  SLinkedList sll = SLinkedList();
  sll.displayNode();

  sll.addNode(10);
  sll.addNode(20);
  sll.addFirst(1);
  sll.addNode(50);
  sll.addLast(50);
  sll.deleteFirst();
  sll.deleteByData(20);
  sll.insertAfter(10, 35);
  sll.displayNode();

  // print(sll.currNode?.data);
}
