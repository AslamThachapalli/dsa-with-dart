import 'package:dsa_dart/linkedList/challenges/find_middle_node.dart';
import 'package:dsa_dart/linkedList/challenges/remove_occurrences.dart';
import 'package:dsa_dart/linkedList/challenges/reverse_linked_list.dart';
import 'package:dsa_dart/linkedList/linked_list.dart';
import 'package:dsa_dart/stack/challenges/reverse_a_list.dart';

void main() {
  final list = LinkedList<int>();

  list.push(3);
  list.push(3);
  list.push(5);
  list.push(3);
  list.push(3);
  list.push(4);
  list.push(3);
  list.push(3);
  list.push(3);
  list.push(2);
  list.push(1);
  list.push(3);
  list.push(3);
  print("Before: $list");

  list.removeAll(3);
  print("After : $list");
}
