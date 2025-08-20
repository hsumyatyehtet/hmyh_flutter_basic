import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: WidgetColumRowExample()));
}

class WidgetColumRowExample extends StatelessWidget {
  const WidgetColumRowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ColumnExample());
  }
}

class ColumnExample extends StatelessWidget {
  const ColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // Main axis alignment (vertical for Column)
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // Cross axis alignment (horizontal for Column)
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
          child: const Center(
            child: Text("Box 1"),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.green,
          child: const Center(
            child: Text("Box 2"),
          ),
        ),
        RowExample(),
      ],
    );
  }
}

class RowExample extends StatelessWidget {
  const RowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 100,
            color: Colors.red,
            child: const Center(
              child: Text("Box 1"),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 100,
            color: Colors.green,
            child: const Center(
            child: Text("Box 2"),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 100,
            color: Colors.blue,
            child: const Center(
            child: Text("Box 3") ,
            ),
          ),
        ),
      ],
    );
  }
}
