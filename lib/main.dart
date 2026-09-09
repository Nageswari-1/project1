import 'package:flutter/material.dart';
import 'version2.dart';

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
      home: const MusicPlaylistV2(),
    );
  }
}