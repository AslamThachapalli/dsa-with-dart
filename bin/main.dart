import 'package:dsa_dart/binary_search_tree/challenges/is_bst.dart';
import 'package:dsa_dart/binary_tree/binary_node.dart';

BinaryNode<int> buildExampleTree() {
  final three = BinaryNode(3);
  final one = BinaryNode(1);
  final four = BinaryNode(4);
  final zero = BinaryNode(0);
  final two = BinaryNode(2);
  final five = BinaryNode(5);

  three.leftChild = one;
  three.rightChild = four;

  one.leftChild = zero;
  one.rightChild = two;

  four.rightChild = five;

  return three;
}

void main() {
  final tree = buildExampleTree();

  print(tree.isBinarySearchTree());
}
