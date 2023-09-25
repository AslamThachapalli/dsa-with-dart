// Create a method that checks if the current tree contains all the elements of
// another tree.

import 'package:dsa_dart/binary_tree/binary_node.dart';

import '../binary_search_tree.dart';

// bool checkIsSubTree<E>({
//   required BinaryNode<E> treeToCheck,
//   required BinaryNode<E> parentTree,
// }) {
//   Set set = <E>{};
//   parentTree?.traverseInOrder((value) {
//     set.add(E);
//   });
//
//   bool isEqual = true;
//
//   treeToCheck.traverseInOrder((value) {
//     isEqual = isEqual && set.contains(value);
//   });
//
//   return isEqual;
// }

extension Subtree<E> on BinarySearchTree {
  bool containsSubtree(BinarySearchTree subtree) {
// 1
    Set set = <E>{};
    root?.traverseInOrder((value) {
      set.add(value);
    });
// 2
    var isEqual = true;
// 3
    subtree.root?.traverseInOrder((value) {
      isEqual = isEqual && set.contains(value);
    });
    return isEqual;
  }
}
