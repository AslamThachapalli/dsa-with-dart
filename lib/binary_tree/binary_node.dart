class BinaryNode<T> {
  BinaryNode(this.value);
  T value;
  BinaryNode<T>? leftChild;
  BinaryNode<T>? rightChild;

  // Traversals

  /// [In-Order Traversal]
  ///
  /// An in-order traversal visits the nodes of a binary tree in the following order,
  /// starting from the root node:
  /// 1. If the current node has a left child, recursively visit this child first.
  /// 2. Then visit the node itself.
  /// 3. If the current node has a right child, recursively visit this child.
  void traverseInOrder(void Function(T value) action) {
    leftChild?.traverseInOrder(action);
    action(value);
    rightChild?.traverseInOrder(action);
  }

  /// [Pre-Order Traversal]
  ///
  /// Pre-order traversal always visits the current node first,
  /// then recursively visits the left and right child.
  void traversePreOrder(void Function(T value) action) {
    action(value);
    leftChild?.traverseInOrder(action);
    rightChild?.traverseInOrder(action);
  }

  /// [Post-Order Traversal]
  ///
  /// Post-order traversal only visits the current node after the left and
  /// right child have been visited recursively
  void traversePostOrder(void Function(T value) action) {
    leftChild?.traversePostOrder(action);
    rightChild?.traversePostOrder(action);
    action(value);
  }

  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(
    BinaryNode<T>? node, [
    String top = '',
    String root = '',
    String bottom = '',
  ]) {
    if (node == null) {
      return '$root null\n';
    }
    if (node.leftChild == null && node.rightChild == null) {
      return '$root ${node.value}\n';
    }
    final a = _diagram(
      node.rightChild,
      '$top ',
      '$top┌──',
      '$top│ ',
    );
    final b = '$root${node.value}\n';
    final c = _diagram(
      node.leftChild,
      '$bottom│ ',
      '$bottom└──',
      '$bottom ',
    );
    return '$a$b$c';
  }
}
