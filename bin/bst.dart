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
}

void main(List<String> args) {
  BinarySearchTree tree = BinarySearchTree();
  tree.insert(10);
  tree.insert(8);
  tree.insert(11);
  tree.remove(11);
  print(tree.contains(11));
  // print(tree.contains(15));
}
