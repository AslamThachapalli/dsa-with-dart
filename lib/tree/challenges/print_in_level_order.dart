// Print all the values in a tree in order based on their level.
// Nodes in the same level should be printed on the same line.

import 'package:dsa_dart/queue/queue.dart';
import 'package:dsa_dart/tree/tree.dart';

void printEachLevel<T>(TreeNode<T> tree) {
  final result = StringBuffer();

  var nodesLeftInCurrentLevel = 0;
  final queue = QueueStack<TreeNode<T>>();
  queue.enqueue(tree);

  while (!queue.isEmpty) {
    nodesLeftInCurrentLevel = queue.length;

    while (nodesLeftInCurrentLevel > 0) {
      var node = queue.dequeue();
      if (node == null) break;

      result.write("${node.value} ");
      for (var child in node.children) {
        queue.enqueue(child);
      }

      nodesLeftInCurrentLevel--;
    }
    result.write('\n');
  }

  print(result);
}
