import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final VoidCallback onTap;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.onTap,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.transparent,
        // InkWell is used to handle tap events
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
                children: [
                  // Expanded widget allows the text to take available space
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,style: theme.textTheme.bodyLarge,),
                          const SizedBox(height: 8,),
                          Text(description),
                          const SizedBox(height: 8,),
                          Text('\$${price.toStringAsFixed(2)}')
                        ],
                      ),
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: onAdd, 
                          icon: const Icon(Icons.add)),
                      IconButton(
                          onPressed: onRemove, 
                          icon: const Icon(Icons.remove))
                    ],
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}
