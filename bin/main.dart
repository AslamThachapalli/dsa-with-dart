import 'package:dsa_dart/binary_search_tree/binary_search_tree.dart';
import 'package:dsa_dart/binary_search_tree/challenges/is_a_subtree.dart';
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

BinarySearchTree<int> buildExampleBTree1() {
  var tree = BinarySearchTree<int>();
  tree.insert(3);
  tree.insert(1);
  tree.insert(4);
  tree.insert(0);
  tree.insert(2);
  tree.insert(5);
  return tree;
}

BinarySearchTree<int> buildExampleBTree2() {
  var tree = BinarySearchTree<int>();
  tree.insert(3);
  tree.insert(1);
  // tree.insert(4);
  // tree.insert(0);
  tree.insert(2);
  tree.insert(5);
  return tree;
}

void main() {
  final tree1 = buildExampleTree1();
  final tree2 = buildExampleTree2();

  final treeB1 = buildExampleBTree1();
  final treeB2 = buildExampleBTree2();

  print(treeB1.containsSubtree(treeB2));
}
