// A doubled-ended queue — a.k.a. deque — is, as its name suggests, a queue where
// elements can be added or removed from the front or back.
//
//Deque can be considered both a queue and a stack at the same time.
//Build a deque

import 'package:dsa_dart/linkedList/linked_list.dart';

enum Direction {
  front,
  back,
}

abstract class Deque<E> {
  bool get isEmpty;
  E? peek(Direction from);
  bool enqueue(E element, Direction to);
  E? dequeue(Direction from);
}

// Linked List Implementation
// This give O(1)T, but for dequeueing from last it takes O(n)T
class DequeLinkedList<E> implements Deque<E> {
  final _list = LinkedList<E>();

  @override
  E? dequeue(Direction from) {
    return switch (from) {
      (Direction.front) => _list.pop(),
      (Direction.back) => _list.removeLast()
    };
  }

  @override
  bool enqueue(E element, Direction to) {
    switch (to) {
      case (Direction.front):
        _list.push(element);
        return true;
      case (Direction.back):
        _list.append(element);
        return true;
    }
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? peek(Direction from) {
    if (isEmpty) return null;

    return switch (from) {
      (Direction.front) => _list.head!.value,
      (Direction.back) => _list.tail!.value
    };
  }

  @override
  String toString() => _list.toString();
}

// Double Stack Implementation
// Here every operation has O(1)T, unless there is a list swapping takes place,
// which can be neglected since it won't be a common operation for large deque.
class DequeStack<E> implements Deque<E> {
  final List<E> _leftStack = <E>[];
  final List<E> _rightStack = <E>[];

  @override
  E? dequeue(Direction from) {
    if (isEmpty) return null;

    switch (from) {
      case (Direction.front):
        checkLeftStackIsEmpty();
        return _leftStack.removeLast();
      case (Direction.back):
        checkRightStackIsEmpty();
        return _rightStack.removeLast();
    }
  }

  @override
  bool enqueue(E element, Direction to) {
    switch (to) {
      case (Direction.front):
        _leftStack.add(element);
        return true;
      case (Direction.back):
        _rightStack.add(element);
        return true;
    }
  }

  @override
  bool get isEmpty => _leftStack.isEmpty && _rightStack.isEmpty;

  @override
  E? peek(Direction from) {
    switch (from) {
      case (Direction.front):
        checkLeftStackIsEmpty();
        return _leftStack.last;
      case (Direction.back):
        checkRightStackIsEmpty();
        return _rightStack.last;
    }
  }

  void checkLeftStackIsEmpty() {
    if (_leftStack.isEmpty) {
      _leftStack.addAll(_rightStack.reversed);
      _rightStack.clear();
    }
  }

  void checkRightStackIsEmpty() {
    if (_rightStack.isEmpty) {
      _rightStack.addAll(_leftStack.reversed);
      _leftStack.clear();
    }
  }

  @override
  String toString() {
    final combined = [
      ..._leftStack.reversed,
      ..._rightStack,
    ];
    return "$combined";
  }
}
