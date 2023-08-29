class Node<T> {
  Node({required this.value, this.next});

  T value;
  Node<T>? next;

  @override
  String toString() {
    if (next == null) return "$value";
    return "$value -> ${next.toString()}";
  }
}

// Implementing Iterable enables us to loop through the linked list.
// We are extending (rather than implementing) here because Iterable has various default logic
// like map, where, etc.
class LinkedList<E> extends Iterable {
  Node<E>? head;
  Node<E>? tail;

  @override
  bool get isEmpty => head == null;

  //Add Operations//

  ///Adds element to the front of the list
  void push(E entry) {
    head = Node(value: entry, next: head);
    tail ??= head;
  }

  ///Appends element to the end of the list
  void append(E entry) {
    //if list is empty, then append is same as push
    if (isEmpty) {
      push(entry);
      return;
    }

    //create a new node after the tail node
    tail!.next = Node(value: entry);
    //assign this new node as tail
    tail = tail!.next;
  }

  Node<E>? nodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;

    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }

    return currentNode;
  }

  ///Inserting in middle of a list
  Node<E> insertAfter(Node<E> node, E value) {
    if (tail == node) {
      append(value);
      return tail!;
    }

    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  //Removal Operations//

  ///Removes element from the front of a list
  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }

    return value;
  }

  ///Removes element from the end of a list
  E? removeLast() {
    if (head?.next == null) return pop();

    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }

    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }

  ///Removes element from the middle of a list
  E? removeAfter(Node<E> node) {
    final value = node.next?.value;

    node.next = node.next?.next;
    if (node == tail) {
      tail = node;
    }
    return value;
  }

  @override
  String toString() {
    if (head == null) return "Empty List";
    return head.toString();
  }

  @override
  Iterator get iterator => _LinkedListIterator(this);
}

///Using an Iterator we can define how to move through our linked list.
///This has two properties to override: [current] and [moveNext]
///
/// [current] => current refers to the current element in the collection as you are iterating
/// through it. According to Iterator semantics, current is undefined until you’ve
/// called moveNext at least once.
///
/// [moveNext] => moveNext updates the new value of current, so it’s out job here to point to
/// whatever item is next in the list. Returning false from this method means that
/// we’ve reached the end of the list. After that point, we should consider current
/// undefined again.
class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(LinkedList<E> list) : _list = list;
  final LinkedList<E> _list;

  Node<E>? currentNode;

  @override
  E get current => currentNode!.value;

  bool _firstPass = true;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;

    if (_firstPass) {
      currentNode = _list.head;
      _firstPass = false;
    } else {
      currentNode = currentNode?.next;
    }

    return currentNode != null;
  }
}
