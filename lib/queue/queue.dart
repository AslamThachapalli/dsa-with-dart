import 'package:dsa_dart/linkedList/linked_list.dart';
import 'package:dsa_dart/queue/ring_buffer.dart';

abstract class Queue<E> {
  bool enqueue(E element);
  E? dequeue();
  bool get isEmpty;
  E? get peek;
}

// A queue can be created using four different internal data structures:
// • List
// • Doubly linked list
// • Ring buffer
// • Two stacks

// List Based Implementation
class QueueList<E> implements Queue<E> {
  final _list = <E>[];

  @override
  dequeue() => (isEmpty) ? null : _list.removeAt(0);

  @override
  bool enqueue(E element) {
    _list.add(element);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  get peek => (isEmpty) ? null : _list.first;
}

// Linked List Implementation
class QueueLinkedList<E> implements Queue<E> {
  final _list = LinkedList<E>();

  @override
  E? dequeue() => _list.pop();

  @override
  bool enqueue(E element) {
    _list.append(element);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => _list.head?.value;
}

// Ring Buffer implementation
class QueueRingBuffer<E> implements Queue<E> {
  QueueRingBuffer(int length) : _ringBuffer = RingBuffer<E>(length);

  final RingBuffer<E> _ringBuffer;

  @override
  E? dequeue() => _ringBuffer.read();

  @override
  bool enqueue(E element) {
    if (_ringBuffer.isFull) {
      return false;
    }
    _ringBuffer.write(element);
    return true;
  }

  @override
  bool get isEmpty => _ringBuffer.isEmpty;

  @override
  E? get peek => _ringBuffer.peek;

  @override
  String toString() => _ringBuffer.toString();
}

// Double Stack Implementation
class QueueStack<E> implements Queue<E> {
  final List<E> _leftStack = <E>[];
  final List<E> _rightStack = <E>[];

  @override
  E? dequeue() {
    if (_leftStack.isEmpty) {
      _leftStack.addAll(_rightStack.reversed);
      _rightStack.clear();
    }
    if (_leftStack.isEmpty) return null;

    return _leftStack.removeLast();
  }

  @override
  bool enqueue(E element) {
    _rightStack.add(element);
    return true;
  }

  @override
  bool get isEmpty => _leftStack.isEmpty && _rightStack.isEmpty;

  @override
  E? get peek => isEmpty
      ? null
      : _leftStack.isEmpty
          ? _rightStack.first
          : _leftStack.last;

  int get length => _leftStack.length + _rightStack.length;

  @override
  String toString() {
    final combined = [
      ..._leftStack.reversed,
      ..._rightStack,
    ];

    return "$combined";
  }
}
