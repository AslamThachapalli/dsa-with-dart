// Check for balanced parentheses. Given a string, check if there are '(' and ')'
// characters, and return true if the parentheses in the string are balanced.
// For example:
// 1
// h((e))llo(world)() -> balanced parentheses
// 2
// (hello world -> unbalanced parentheses

import 'package:dsa_dart/stack/stack.dart';

bool isParenthesesBalanced(String input) {
  final stack = Stack<String>();

  final String open = '(';
  final String close = ')';

  final List<String> inputIter = input.split('');
  for (var letter in inputIter) {
    if (letter == open) {
      stack.push(letter);
    } else if (letter == close) {
      if (stack.isEmpty) {
        return false;
      } else {
        stack.pop();
      }
    }
  }

  return stack.isEmpty;
}
