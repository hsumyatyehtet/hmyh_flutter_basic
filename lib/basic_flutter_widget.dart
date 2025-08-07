import 'package:flutter/material.dart';

void main() {
  runApp(const BasicFlutterWidget());
}

class BasicFlutterWidget extends StatelessWidget {
  const BasicFlutterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BasicStatelessWidget(),BasicStateFullWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class BasicStatelessWidget extends StatelessWidget {
  const BasicStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Building BasicStatelessWidget');
    return const Text('Hello Stateless Widget');
  }
}

class BasicStateFullWidget extends StatefulWidget{
  const BasicStateFullWidget({super.key});

  @override
  State<StatefulWidget> createState() => _BasicStateFullWidgetState();
}

class _BasicStateFullWidgetState extends State<BasicStateFullWidget> {

  String _text = 'Initial text';

  void _updateText(){
    setState(() {
      _text = 'Updated text';
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Building BasicStateFullWidget');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(_text),
        ElevatedButton(
            onPressed: _updateText,
            child: Text('Update')),
      ],
    );
  }
}
