
class Node {
  int data;
  Node? next;
  Node({required this.data});
}

class DynamicStack {
  Node? top;

  push(int data) {
    Node newNode = Node(data: data);
    if (top == null) {
      top = newNode;
    } else {
      newNode.next = top;
      top = newNode;
    }
  }

  peek(){
    if (top==null) {
      print('Nothing Found');
    } else {
      print(top?.data);
    }
  }

  pop() {
    if (top != null) {
      top = top?.next;
    } else {
      print('stack underflow');
    }
  }

  display() {
    if (top == null) {
      print('Empty Linked List');
      return;
    }
    Node? current = top;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}
class StaticStack {
  
}

void main(List<String> args) {
  DynamicStack stack = DynamicStack();
  stack.display();
  stack.push(1);
  stack.push(2);
  // stack.push(3);
  stack.push(4);
  // // stack.display();
  // stack.pop();
  stack.display();
  print("\n");
  stack.peek();

}
