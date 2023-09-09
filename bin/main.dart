import 'package:dsa_dart/binary_tree/binary_node.dart';
import 'package:dsa_dart/binary_tree/challenges/serialization.dart';

BinaryNode<int> createBinaryTree() {
  final zero = BinaryNode(0);
  final one = BinaryNode(1);
  final five = BinaryNode(5);
  final seven = BinaryNode(7);
  final eight = BinaryNode(8);
  final nine = BinaryNode(9);
  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;
  return seven;
}

void main() {
  final tree = createBinaryTree();

  print(tree);
  final serialized = serialize(tree);
  print("serialized list: $serialized \n");

  final deTree = deSerialize(serialized);

  print("Deserialized tree");
  print("$deTree");
}
