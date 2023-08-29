// Create a function that prints the contents of a list in reverse order.

import 'package:dsa_dart/stack/stack.dart';

void printListInReverse(List list) {
  final stackList = Stack.of(list);

  while (stackList.isNotEmpty) {
    print(stackList.pop());
  }
}
