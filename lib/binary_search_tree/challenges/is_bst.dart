// Write a function that checks if a binary tree is a binary search tree.

import 'package:dsa_dart/binary_tree/binary_node.dart';

extension Checker<E extends Comparable<dynamic>> on BinaryNode<E> {
  bool isBinarySearchTree() {
    return _isBst(this, max: null, min: null);
  }

  bool _isBst(BinaryNode<E>? node, {E? max, E? min}) {
    if (node == null) return true;

    if (max != null && (max.compareTo(node.value) < 0)) {
      return false;
    } else if (min != null && (min.compareTo(node.value) > 0)) {
      return false;
    }

    return _isBst(node.leftChild, max: node.value, min: null) &&
        _isBst(node.rightChild, max: null, min: node.value);
  }
}
