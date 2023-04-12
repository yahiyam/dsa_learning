
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

  peek() {
    if (top == null) {
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
    print("\n");
  }
}

class StaticStack {
  int top = -1;
  int capacity = 10;
  List stack = List.filled(10, 0);

  push(int data) {
    if (top < capacity - 1) {
      top++;
      stack[top] = data;
      print('pushed item $data');
    } else {
      print('stack Overflow');
    }
  }

  pop() {
    if (top >= 0) {
      int data = stack[top];
      top--;
      print('popped item $data');
    } else {
      print('stack underflow');
    }
  }

  display() {
    if (top >= 0) {
      print('stack elements');
      for (int i = top; i >= 0; i--) {
        print(stack[i]);
      }
    } else {
      print('stack is empty');
    }
  }
}

class Queue {
  Node? front, rear;
  enqueue(int data) {
    Node newNode = Node(data: data);
    if (rear == null) {
      front = rear = newNode;
    } else {
      rear?.next = newNode;
      rear = newNode;
    }
  }

  dequeue() {
    if (front == null) {
      print('queue is empty');
    } else {
      front = front?.next;
    }
    if (front == null) {
      rear = null;
    }
  }

  display() {
    if (front == null) {
      print('Empty Linked List');
      return;
    }
    Node? current = front;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
    print("\n");
  }
}

void main(List<String> args) {
  // // DynamicStack stack = DynamicStack();
  // // stack.display();
  // // stack.push(1);
  // // stack.push(2);
  // // // stack.push(3);
  // // stack.push(4);
  // // // // stack.display();
  // // // stack.pop();
  // // stack.display();
  // // stack.peek();
  // Queue queue = Queue();
  // queue.enqueue(1);
  // queue.enqueue(3);
  // queue.enqueue(2);
  // queue.enqueue(5);
  // queue.dequeue();
  // queue.display();
  StaticStack staticStack=StaticStack();
  staticStack.push(10);
  staticStack.push(111);
  staticStack.push(11);
  staticStack.push(1);
  staticStack.pop();
  staticStack.display();
}
