import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hmyh_flutter_basic/widgets/product_cart.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: MyScrollViewSample()));
}

class MyScrollViewSample extends StatelessWidget {
  const MyScrollViewSample({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('ScrollView Example')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Hello, check the following items',
                  style: theme.textTheme.titleLarge,
                ),
              ),
              Divider(),
              ...List.generate(
                20,
                (index) => ProductCard(
                  title: "Product $index",
                  description: 'This is the description for product $index',
                  price: 100.0,
                  onTap: () {},
                  onAdd: () {},
                  onRemove: () {},
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Great, you have seen all the items',
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
