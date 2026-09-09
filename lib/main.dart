import 'package:flutter/material.dart';

void main() {
  runApp(const MusicPlaylistApp());
}

class MusicPlaylistApp extends StatelessWidget {
  const MusicPlaylistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Playlist',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Music Playlist'),
        ),
        body: const Center(
          child: Text(
            'Welcome to Music Playlist App',
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}