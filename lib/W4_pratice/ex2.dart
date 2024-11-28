import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum Product {
  Dart(
    imagePath: 'assets/image.png',
    title: 'Dart',
    description: 'The best object language',
  ),
  Flutter(
    imagePath: 'assets/Untitle.png',
    title: 'Flutter',
    description: 'The best mobile UI library',
  ),
  Firebase(
    imagePath: 'assets/Untitle.png',
    title: 'Firebase',
    description: 'The best cloud database',
  );

  final String imagePath;
  final String title;
  final String description;

  const Product({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Products')),
        body: const ProductsList(),
      ),
    );
  }
}

// Part 3: Stateless widget for a list of products
class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: Product.values.map((product) {
          return ProductCard(
            imagePath: product.imagePath,
            title: product.title,
            description: product.description,
          );
        }).toList(),
      ),
    );
  }
}

// Part 1: Create a single ProductCard widget
class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
