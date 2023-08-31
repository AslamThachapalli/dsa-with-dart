// Imagine that you are playing a game of Monopoly with your friends. The problem is
// that everyone always forgets whose turn it is! Create a Monopoly organizer that
// always tells you whose turn it is.

import 'package:dsa_dart/queue/queue.dart';

extension BoardGameManager<E> on QueueRingBuffer {
  E? nextPlayer() {
    final person = dequeue();
    if (person != null) {
      enqueue(person);
    }
    return person;
  }
}
