import 'package:dsa_dart/queue/queue.dart';

class TreeNode<T> {
  TreeNode(this.value);
  T value;
  List<TreeNode<T>> children = [];

  void add(TreeNode<T> child) {
    children.add(child);
  }

  // Traversing through a tree.
  // Traversing through a list is straight forward, it has a definite start and
  // end points. But in tree it becomes a lil bit tricky.
  // There are multiple ways to traverse a tree, each approach depends on our
  // specific requirements.

  /// Depth-First Traversal
  /// This technique starts at the root and visits nodes as deep as it can before backtracking.
  void forEachDepthFirst(void Function(TreeNode<T> node) performAction) {
    performAction(this);
    for (final child in children) {
      child.forEachDepthFirst(performAction);
    }
  }

  /// Level-Order Traversal
  /// A tree can be divided into levels based on the distance of the nodes from the root.
  /// A level-order traversal means that you visit all of the nodes at an upper level before
  /// visiting any of the nodes at the next level down.
  void forEachLevelOrder(void Function(TreeNode<T> node) performAction) {
    final queue = QueueStack<TreeNode<T>>();
    performAction(this);
    children.forEach(queue.enqueue);
    var node = queue.dequeue();
    while (node != null) {
      performAction(node);
      node.children.forEach(queue.enqueue);
      node = queue.dequeue();
    }
  }

  TreeNode<T>? search(T value) {
    TreeNode<T>? result;
    forEachLevelOrder((node) {
      if (node.value == value) {
        result = node;
      }
    });
    return result;
  }
}
