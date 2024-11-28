import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Gallery',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ImageGallery(),
    );
  }
}

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  final List<String> imagePaths = [
    'lib/assets/image1.png',
    'lib/assets/image2.png',
    'lib/assets/image3.png',
  ];
  int currentIndex = 0;

  void _showNextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % imagePaths.length;
    });
  }

  void _showPreviousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + imagePaths.length) % imagePaths.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Viewer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                imagePaths[currentIndex],
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: _showPreviousImage,
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: _showNextImage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
