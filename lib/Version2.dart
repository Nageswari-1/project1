import 'package:flutter/material.dart';

class MusicPlaylistV2 extends StatelessWidget {
  const MusicPlaylistV2({super.key});

  final List<String> songs = const [
    'Perfect - Ed Sheeran',
    'Shape of You - Ed Sheeran',
    'Believer - Imagine Dragons',
    'Night Changes - One Direction',
    'Photograph - Ed Sheeran',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Playlist'),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // STACK: Image with text and icon on top
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1511379938547-c1f69419868d',
                    fit: BoxFit.cover,
                  ),
                ),

                const Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    'My Favorite Playlist',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const Positioned(
                  top: 15,
                  right: 15,
                  child: Icon(
                    Icons.music_note,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // COLUMN: Playlist title and description
            const Column(
              children: [
                Text(
                  'My Songs',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Listen to your favorite songs',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // ROW: Icons and playlist information
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepPurple.shade50,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.library_music),
                  Text('5 Songs'),
                  Icon(Icons.favorite),
                  Text('Favorites'),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // SONG LIST
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.music_note,
                      size: 30,
                    ),
                    title: Text(songs[index]),
                    trailing: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Playing ${songs[index]}',
                            ),
                          ),
                        );
                      },
                      child: const Text('Play'),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}