
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: LayoutBuilderSample()));
}

class LayoutBuilderSample extends StatelessWidget {
  const LayoutBuilderSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LayoutBuilder Example')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          if (width > 800) {
            return _buildWideLayout();
          } else if (width > 400) {
            return _buildMediumLayout();
          } else {
            return _buildNarrowLayout();
          }
        },
      ),
    );
  }
}

Widget _buildWideLayout() {
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: Container(
          color: Colors.blue[100],
          child: const Center(
            child: Text('Sidebar\n(Wide Layout)', textAlign: TextAlign.center),
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: Container(
          color: Colors.green[100],
          child: const Center(
            child: Text(
              'Main Content\n(Wide Layout)',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildMediumLayout() {
  return Column(
    children: [
      Container(
        height: 100,
        color: Colors.orange[100],
        child: const Center(child: Text('Header (Medium Layout)')),
      ),
      Expanded(
        child: Container(
          color: Colors.purple[100],
          child: const Center(child: Text('Content (Medium Layout')),
        ),
      ),
    ],
  );
}

Widget _buildNarrowLayout() {
  return Container(
    color: Colors.red[100],
    child: const Center(
      child: Text(
        'Single Column\n(Narrow Layout)',
        textAlign: TextAlign.center,
      ),
    ),
  );
}
