import 'package:dsa_dart/binary_tree/binary_node.dart';

class BinarySearchTree<E extends Comparable<dynamic>> {
  BinaryNode<E>? root;

  void insert(E value) {
    root = _insertAt(root, value);
  }

  BinaryNode<E> _insertAt(BinaryNode<E>? node, E value) {
    if (node == null) return BinaryNode(value);

    if (value.compareTo(node.value) < 0) {
      node.leftChild = _insertAt(node.leftChild, value);
    } else {
      node.rightChild = _insertAt(node.rightChild, value);
    }

    return node;
  }

  bool contains(E value) {
    var current = root;

    while (current != null) {
      if (current.value == value) return true;

      if (value.compareTo(current.value) < 0) {
        current = current.leftChild;
      } else {
        current = current.rightChild;
      }
    }

    return false;
  }

  void remove(E value) {
    root = _remove(root, value);
  }

  BinaryNode<E>? _remove(BinaryNode<E>? node, E value) {
    if (node == null) return null;

    if (node.value == value) {
      // node is a leaf node
      if (node.leftChild == null && node.rightChild == null) {
        return null;
      }

      // node has no left child, so replace the node with its right child
      if (node.leftChild == null) {
        return node.rightChild;
      }

      // similarly, node has no right child
      if (node.rightChild == null) {
        return node.leftChild;
      }

      // node has both sides. Then replace the node with the leftmost child of
      // the node's right child (This will ensure the BST principle is respected).
      // Then remove the leftmost node.
      node.value = node.rightChild!.min.value;
      node.rightChild = _remove(node.rightChild, node.value);
    } else if (value.compareTo(node.value) < 0) {
      node.leftChild = _remove(node.leftChild, value);
    } else {
      node.rightChild = _remove(node.rightChild, value);
    }

    return node;
  }

  @override
  String toString() => root.toString();
}

extension _MinFinder<E> on BinaryNode<E> {
  BinaryNode<E> get min => leftChild?.min ?? this;
}
