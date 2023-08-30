// Create a function that reverses a linked list. You do this by manipulating the nodes
// so that they’re linked in the other direction. For example:
// -> before
// 1 -> 2 -> 3 -> null
// -> after
// 3 -> 2 -> 1 -> null

import 'package:dsa_dart/linkedList/linked_list.dart';

// Method 1 //

// --> Using the recursion method looks elegant, but if the list is very long,
//     it can cause stackoverflow issue <--
void reverseNodeRecursively<T>(Node<T>? node) {
  if (node?.next == null) return;

  reverseNodeRecursively(node?.next);
  var prevNode = node;
  node?.next?.next = prevNode;
}

void reverseTheList<E>(LinkedList<E> linkedList) {
  reverseNodeRecursively(linkedList.head);

  var temp = linkedList.head;
  linkedList.head = linkedList.tail;
  linkedList.tail = temp;

  linkedList.tail?.next = null;
}
// --> <-- //

// Method 2

extension ReversibleLinkedList<E> on LinkedList<E> {
  void reverse() {
    tail = head;
    var previous = head;
    var current = head?.next;
    previous?.next = null;

    while (current != null) {
      var next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }

    head = previous;
  }
}
