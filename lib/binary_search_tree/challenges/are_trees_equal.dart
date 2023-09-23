// Given two binary trees, how would you test if they are equal or not?

import 'package:dsa_dart/binary_tree/binary_node.dart';

checkEquality<E>(BinaryNode<E> tree1, BinaryNode<E> tree2) {
  return _checkEqualityRecursively(tree1, tree2);
}

bool _checkEqualityRecursively<E>(BinaryNode<E>? node1, BinaryNode<E>? node2) {
  if (node1 == null && node2 == null) return true;

  if (node1 == null || node2 == null) return false;

  if (node1.value != node2.value) return false;

  return _checkEqualityRecursively(node1.leftChild, node2.leftChild) &&
      _checkEqualityRecursively(node1.rightChild, node2.rightChild);
}
