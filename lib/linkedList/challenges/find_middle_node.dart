// Create a function that finds the middle node of a linked list.
// For example:
// 1 -> 2 -> 3 -> 4 -> null
// ---> middle is 3
// 1 -> 2 -> 3 -> null
// ---> middle is 2

import 'package:dsa_dart/linkedList/linked_list.dart';

Node<E>? getMiddleNode<E>(LinkedList<E> linkedList) {
  var fast = linkedList.head;
  var slow = linkedList.head;

  while (fast?.next != null) {
    fast = fast?.next?.next;
    slow = slow?.next;
  }

  return slow;
}
