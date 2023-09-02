// Flutter calls the nodes in its user-facing UI tree widgets. Make a
// mini-version of the same thing.
// Create three separate nodes with the following names and types:
// • Column: a tree node that takes multiple children.
// • Padding: a tree node that takes a single child.
// • Text: a tree leaf node.
// Use the widget nodes to build a simple widget tree.

class Widget {}

class Column extends Widget {
  Column({this.children});
  List<Widget>? children;
}

class Padding extends Widget {
  Padding({this.value = 0.0, this.child});
  double value;
  Widget? child;
}

class Text extends Widget {
  Text([this.value = ""]);
  String value;
}

final tree = Column(
  children: [
    Padding(
      value: 8.0,
      child: Text('This'),
    ),
    Padding(
      value: 8.0,
      child: Text('is'),
    ),
    Column(
      children: [
        Text('my'),
        Text('widget'),
        Text('tree!'),
      ],
    ),
  ],
);
