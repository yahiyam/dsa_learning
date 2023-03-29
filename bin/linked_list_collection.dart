import 'dart:collection';

class Node extends LinkedListEntry<Node> {
  final int data;
  @override
  Node? next;
  Node({required this.data});
  @override
  String toString() {
    return '$data';
  }
}

void main(List<String> args) {
  List arr = [
    45,
    5346,
    6,
    4,
    1,
    87,
  ];
  final node = LinkedList<Node>();
  for (var element in arr) {
    node.add(Node(data: element));
  }
  node.elementAt(3).insertBefore(Node(data: 4));
  print(node.toList().reversed);
}
