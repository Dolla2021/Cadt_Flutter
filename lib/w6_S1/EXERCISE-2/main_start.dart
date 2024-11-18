import 'package:flutter/material.dart';
import 'package:flutte_demo/w6_S1/EXERCISE-2/data/profile_data.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(),
  ));
}

const Color mainColor = Color(0xff5E9FCD);

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor.withAlpha(100),
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(ronanProfile.avatarUrl),
              ),
              const SizedBox(height: 20),
              Text(
                ronanProfile.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
              Text(
                ronanProfile.position,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              ...ronanProfile.tiles.map((tile) {
                return ProfileTile(
                  icon: tile.icon,
                  title: tile.title,
                  data: tile.value,
                );
              }),
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(ronanProfile.avatarUrl),
              ),
              const SizedBox(height: 20),
              Text(
                dolaProfile.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
              Text(
                dolaProfile.position,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              ...dolaProfile.tiles.map((tile) {
                return ProfileTile(
                  icon: tile.icon,
                  title: tile.title,
                  data: tile.value,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: mainColor),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}
