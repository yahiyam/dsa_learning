class Node {
  int data;
  Node? left, right;
  Node({required this.data});
}

class BinarySearchTree {
  Node? root;
  insert(int data) {
    Node newNode = Node(data: data);
    Node? currentNode = root;
    if (currentNode == null) {
      root = newNode;
      return;
    }
    while (true) {
      if (data < currentNode!.data) {
        if (currentNode.left == null) {
          currentNode.left = newNode;
          break;
        } else {
          currentNode = currentNode.left;
        }
      } else {
        if (currentNode.right == null) {
          currentNode.right = newNode;
          break;
        } else {
          currentNode = currentNode.right;
        }
      }
    }
  }

  contains(int data) {
    Node? currentNode = root;
    while (currentNode != null) {
      if (data < currentNode.data) {
        currentNode = currentNode.left;
      } else if (data > currentNode.data) {
        currentNode = currentNode.right;
      } else {
        return true;
      }
    }
    return false;
  }

  findClosest(int target) {
    Node? current = root;
    int? closest = current?.data;
    while (current != null) {
      if ((target - closest!).abs() > (target - current.data).abs()) {
        closest = current.data;
      }
      if (target < current.data) {
        current = current.left;
      } else if (target > current.data) {
        current = current.right;
      } else {
        break;
      }
    }
    return closest;
  }

//
  remove(int data) {
    removeHelper(data, root, null);
  }

  removeHelper(int data, Node? currentNode, Node? parentNode) {
    while (currentNode != null) {
      if (data < currentNode.data) {
        parentNode = currentNode;
        currentNode = currentNode.left;
      } else if (data > currentNode.data) {
        parentNode = currentNode;
        currentNode = currentNode.right;
      } else {
        if (currentNode.left != null && currentNode.right != null) {
          currentNode.data = getMiniValue(currentNode.right);
          removeHelper(currentNode.data, currentNode.right, currentNode);
        } else {
          if (parentNode == null) {
            if (currentNode.right == null) {
              root = currentNode.left;
            } else {
              root = currentNode.right;
            }
          } else {
            if (parentNode.left == currentNode) {
              if (currentNode.right == null) {
                parentNode.left = currentNode.left;
              } else {
                parentNode.left = currentNode.right;
              }
            } else {
              if (currentNode.right == null) {
                parentNode.right = currentNode.left;
              } else {
                parentNode.right = currentNode.right;
              }
            }
          }
        }
        break;
      }
    }
  }

  int getMiniValue(Node? currentNode) {
    if (currentNode!.left == null) {
      return currentNode.data;
    } else {
      return getMiniValue(currentNode.left);
    }
  }

//
  inOrder() {
    StringBuffer sb = StringBuffer('IN ORDER => ');
    inOrderHelper(root, sb);
    print(sb.toString());
  }

  inOrderHelper(Node? node, StringBuffer sb) {
    if (node != null) {
      inOrderHelper(node.left, sb);
      sb.write('${node.data} ');
      inOrderHelper(node.right, sb);
    }
  }

  preOrder() {
    StringBuffer sb = StringBuffer('PRE ORDER => ');
    preOrderHelper(root, sb);
    print(sb.toString());
  }

  preOrderHelper(Node? node, StringBuffer sb) {
    if (node != null) {
      sb.write('${node.data} ');
      preOrderHelper(node.left, sb);
      preOrderHelper(node.right, sb);
    }
  }

  postOrder() {
    StringBuffer sb = StringBuffer('POST ORDER => ');
    postOrderHelper(root, sb);
    print(sb.toString());
  }

  postOrderHelper(Node? node, StringBuffer sb) {
    if (node != null) {
      postOrderHelper(node.left, sb);
      postOrderHelper(node.right, sb);
      sb.write('${node.data} ');
    }
  }
}

void main(List<String> args) {
  BinarySearchTree tree = BinarySearchTree();
  tree.insert(10);
  tree.insert(8);
  tree.insert(11);
  tree.insert(4);
  tree.insert(9);
  // tree.inOrder();
  // tree.preOrder();
  // tree.postOrder();
  // tree.remove(11);
  int target = 7;
  int closest = tree.findClosest(target);
  print("Closest value to $target: $closest");
  // print(tree.contains(11));
  // print(tree.contains(15));
}
