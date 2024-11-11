import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Gallery',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ImageGallery(),
    );
  }
}

class ImageGallery extends StatefulWidget {
  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  final List<String> imagePaths = [
    'assets/image/image1.png',
    'assets/image/image2.png',
    'assets/image/image3.png',
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
        title: Text('Image Viewer'),
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
                    icon: Icon(Icons.arrow_back),
                    onPressed: _showPreviousImage,
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
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
