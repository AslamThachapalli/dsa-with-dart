import 'package:dsa_dart/queue/challenges/deque.dart';

void main() {
  final deque = DequeStack<int>();

  deque.enqueue(1, Direction.back);
  deque.enqueue(2, Direction.back);
  deque.enqueue(3, Direction.back);
  deque.enqueue(4, Direction.back);
  print(deque);
  deque.enqueue(5, Direction.front);
  print(deque);
  deque.dequeue(Direction.front);
  deque.dequeue(Direction.front);
  deque.dequeue(Direction.back);
  deque.dequeue(Direction.front);
  deque.dequeue(Direction.front);
  deque.dequeue(Direction.front);
  print(deque);
}
