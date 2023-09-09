// Devise a way to serialize a binary tree into a list, and a way to
// deserialize the list back into the same binary tree.

import 'package:dsa_dart/binary_tree/binary_node.dart';

void _addToListRecursively<T>(BinaryNode<T>? node, List<T?> list) {
  if (node == null) {
    list.add(null);
    return;
  }
  list.add(node.value);

  _addToListRecursively(node.leftChild, list);
  _addToListRecursively(node.rightChild, list);
}

List<T?> serialize<T>(BinaryNode<T>? node) {
  final List<T?> serializedList = <T?>[];

  _addToListRecursively(node, serializedList);

  return serializedList;
}

BinaryNode<T>? _deSerializeRecursively<T>(List<T?> list) {
  if (list.isEmpty) return null;
  final value = list.removeLast();
  if (value == null) return null;

  final node = BinaryNode(value);

  node.leftChild = _deSerializeRecursively(list);
  node.rightChild = _deSerializeRecursively(list);

  return node;
}

BinaryNode<T>? deSerialize<T>(List<T> list) {
  return _deSerializeRecursively(list.reversed.toList());
}
