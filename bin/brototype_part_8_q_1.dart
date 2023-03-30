//6,10,5,5,5,8,8
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

  removeDuplicate() {
    Node? curr = head;
    while (curr != null) {
      Node? next = curr.next;
      while (next != null && next.data == curr.data) {
        next = next.next;
      }
      curr.next = next;
      if (next == tail && curr.data == next?.data) {
        tail = curr;
        tail?.next = null;
      }
      curr = next;
    }
  }
}

void main() {
  SLinkedList sll = SLinkedList();
  sll.addNode(10);
  sll.addNode(10);
  sll.addNode(20);
  sll.addNode(20);
  sll.addNode(20);
  sll.removeDuplicate();
  sll.displayNode();
}
