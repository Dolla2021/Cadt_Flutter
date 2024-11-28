import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite Cards App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FavoriteCardsPage(),
    );
  }
}

class FavoriteCardsPage extends StatelessWidget {
  const FavoriteCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Cards'),
      ),
      body: ListView(
        children: const [
          FavoriteCard(title: 'Card 1', description: 'Description for card 1'),
          FavoriteCard(title: 'Card 2', description: 'Description for card 2'),
          FavoriteCard(title: 'Card 3', description: 'Description for card 3'),
        ],
      ),
    );
  }
}

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;

  const FavoriteCard(
      {super.key, required this.title, required this.description});

  @override
  _FavoriteCardState createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
      ),
    );
  }
}
