// Create a function that removes all occurrences of a specific element from a linked
// list. For example:
// original list
// 1 -> 3 -> 3 -> 3 -> 4
// list after removing all occurrences of 3
// 1 -> 4

import 'package:dsa_dart/linkedList/linked_list.dart';

extension RemovableLinkedList<E> on LinkedList<E> {
  void removeAll(E value) {
    while (head?.value == value) {
      head = head?.next;
    }

    var previous = head;
    var current = head?.next;

    while (current != null) {
      if (current.value == value) {
        previous?.next = current.next;
        current = previous?.next;
        continue;
      }
      previous = current;
      current = current.next;
    }
  }
}
