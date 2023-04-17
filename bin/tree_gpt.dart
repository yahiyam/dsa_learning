// ignore_for_file: unnecessary_null_comparison

class TreeNode {
  int val;
  List<TreeNode> children;

  TreeNode(this.val, [this.children = const []]);
}

class Tree {
  late TreeNode root;

  void insert(int parentVal, int val) {
    _insert(root, parentVal, val);
  }

  void _insert(TreeNode node, int parentVal, int val) {
    if (node == null) {
      return;
    }

    if (node.val == parentVal) {
      node.children.add(TreeNode(val));
      return;
    }

    for (TreeNode child in node.children) {
      _insert(child, parentVal, val);
    }
  }

  bool search(int val) {
    return _search(root, val);
  }

  bool _search(TreeNode node, int val) {
    if (node == null) {
      return false;
    }

    if (val == node.val) {
      return true;
    }

    for (TreeNode child in node.children) {
      if (_search(child, val)) {
        return true;
      }
    }

    return false;
  }

  void delete(int val) {
    root = _delete(root, val)!;
  }

  TreeNode? _delete(TreeNode node, int val) {
    if (node == null) {
      return null;
    }

    if (node.val == val) {
      return null;
    }

    List<TreeNode> newChildren = [];

    for (TreeNode child in node.children) {
      TreeNode? newChild = _delete(child, val);
      if (newChild != null) {
        newChildren.add(newChild);
      }
    }

    node.children = newChildren;

    return node;
  }
}
