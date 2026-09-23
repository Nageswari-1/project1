import 'package:flutter/material.dart';

class MusicPlaylistV3 extends StatelessWidget {
  const MusicPlaylistV3({super.key});

  final List<String> songs = const [
    'Perfect - Ed Sheeran',
    'Shape of You - Ed Sheeran',
    'Believer - Imagine Dragons',
    'Night Changes - One Direction',
    'Photograph - Ed Sheeran',
    'Until I Found You - Stephen Sanchez',
  ];

  @override
  Widget build(BuildContext context) {
    // MediaQuery gets the screen size
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Playlist'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Different layouts for different screen widths
          if (constraints.maxWidth < 600) {
            // Mobile layout
            return mobileLayout(screenWidth);
          } else {
            // Tablet/Desktop layout
            return desktopLayout(screenWidth);
          }
        },
      ),
    );
  }

  // Mobile layout
  Widget mobileLayout(double screenWidth) {
    return ListView.builder(
      padding: EdgeInsets.all(screenWidth * 0.03),
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.music_note),
            ),
            title: Text(
              songs[index],
              style: TextStyle(
                fontSize: screenWidth * 0.045,
              ),
            ),
            trailing: const Icon(Icons.play_arrow),
          ),
        );
      },
    );
  }

  // Tablet/Desktop layout
  Widget desktopLayout(double screenWidth) {
    return GridView.builder(
      padding: EdgeInsets.all(screenWidth * 0.03),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return Card(
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.music_note,
                  size: 35,
                ),
              ),
              Expanded(
                child: Text(
                  songs[index],
                  style: TextStyle(
                    fontSize: screenWidth * 0.025,
                  ),
                ),
              ),
              const Icon(Icons.play_arrow),
              const SizedBox(width: 15),
            ],
          ),
        );
      },
    );
  }
}