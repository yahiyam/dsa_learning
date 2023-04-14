class TrieNode {
  Map<String, TrieNode> children = {};

  void addChild(String letter, TrieNode node) {
    children[letter] = node;
  }

  bool containsChild(String letter) {
    return children.containsKey(letter);
  }

  TrieNode? getChild(String letter) {
    return children[letter];
  }

  bool containsEndSymbol() {
    return children.containsKey('*');
  }
}

class Trie {
  TrieNode root = TrieNode();
  String endSymbol = '*';

  Trie(String str) {
    populateSuffixTrie(str);
  }

  void populateSuffixTrie(String str) {
    for (int i = 0; i < str.length; i++) {
      insertSubstringStartingAt(i, str);
    }
  }

  void insertSubstringStartingAt(int index, String str) {
    TrieNode node = root;
    for (int i = index; i < str.length; i++) {
      String letter = str[i];
      if (!node.containsChild(letter)) {
        TrieNode newNode = TrieNode();
        node.addChild(letter, newNode);
      }
      node = node.getChild(letter)!;
    }
    node.addChild(endSymbol, TrieNode());
  }

  bool contains(String str) {
    TrieNode node = root;
    for (int i = 0; i < str.length; i++) {
      String letter = str[i];
      if (!node.containsChild(letter)) {
        return false;
      }
      node = node.getChild(letter)!;
    }
    return node.containsEndSymbol();
  }
}

void main() {
  Trie trie = Trie('banana');
  print(trie.contains('nna')); // output: true
}
