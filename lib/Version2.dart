import 'package:flutter/material.dart';

class MusicPlaylistV2 extends StatelessWidget {
  const MusicPlaylistV2({super.key});

  final List<String> songs = const [
    'Perfect - Ed Sheeran',
    'Shape of You - Ed Sheeran',
    'Believer - Imagine Dragons',
    'Night Changes - One Direction',
    'Photograph - Ed Sheeran',
    'Until I Found You - Stephen Sanchez',
    'Counting Stars - OneRepublic',
    'Faded - Alan Walker',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Playlist'),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.music_note),
              ),
              title: Text(songs[index]),
              trailing: const Icon(Icons.play_arrow),
            ),
          );
        },
      ),
    );
  }
}