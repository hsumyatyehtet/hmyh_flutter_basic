import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: MediaQueryExample()),
  );
}

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenSize = mediaQuery.size;
    final orientation = mediaQuery.orientation;
    final devicePixelRatio = mediaQuery.devicePixelRatio;
    final padding = mediaQuery.padding;

    return Scaffold(
      appBar: AppBar(title: const Text('MediaQuery Example')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //sizeBox used to make card full width
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Screen Width: ${screenSize.width.toStringAsFixed(2)}',
                        ),
                        Text(
                          'Screen Height: ${screenSize.height.toStringAsFixed(2)}',
                        ),
                        Text(
                          'Orientation: ${orientation.name}',
                        ),
                        Text(
                          'Device Pixel Ratio: ${devicePixelRatio.toStringAsFixed(2)}',
                        ),
                        Text(
                          'Safe Area Top: ${padding.top.toStringAsFixed(2)}',
                        ),
                        Text(
                            'Safe  Area Bottom: ${padding.bottom.toStringAsFixed(2)}',
                        ),
                      ],
                    ),
                ),
              ),
            ),
            SizedBox(height: 20,),

            //Responsive design example
            Container(
              width: screenSize.width > 600 ? 400 : screenSize.width * 0.8,
              height: 100,
              decoration: BoxDecoration(
                color: orientation == Orientation.portrait ? Colors.blue : Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  orientation == Orientation.portrait ? 'Portrait Mode' : 'Landscape Mode',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
