// Create a function that prints the nodes of a linked list in reverse order.
// For example:
// 1 -> 2 -> 3 -> null
// should print out the following:
// 3
// 2
// 1

import 'package:dsa_dart/linkedList/linked_list.dart';

void printNodeRecursively<T>(Node<T>? node) {
  if (node == null) return;

  printNodeRecursively(node.next);
  print("${node.value}");
}

void printInReverse<E>(LinkedList<E> linkedList) {
  printNodeRecursively(linkedList.head);
}
