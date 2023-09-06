// Given a binary tree, find the height of the tree. The height of the binary tree is
// determined by the distance between the root and the furthest leaf. The height of a
// binary tree with a single node is zero since the single node is both the root and the
// furthest leaf.

import 'dart:math';

import 'package:dsa_dart/binary_tree/binary_node.dart';

int getHeightOfTree<T>(BinaryNode<T>? node) {
  if (node == null) return -1;

  return 1 +
      max(
        getHeightOfTree(node.leftChild),
        getHeightOfTree(node.rightChild),
      );
}
