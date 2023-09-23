import 'package:dsa_dart/binary_search_tree/challenges/are_trees_equal.dart';
import 'package:dsa_dart/binary_tree/binary_node.dart';

BinaryNode<int> buildExampleTree1() {
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

BinaryNode<int> buildExampleTree2() {
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
  final tree1 = buildExampleTree1();
  final tree2 = buildExampleTree2();

  print(checkEquality(tree1, tree2));
}
