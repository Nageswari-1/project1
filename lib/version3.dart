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
      title: 'Music Playlist App',

      // Named Routes
      initialRoute: '/',

      routes: {
        '/': (context) => const HomeScreen(),
        '/playlist': (context) => const PlaylistScreen(),
        '/songDetails': (context) => const SongDetailsScreen(),
      },
    );
  }
}

// ======================================================
// SCREEN 1: HOME SCREEN
// ======================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Playlist'),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.music_note,
              size: 80,
            ),

            const SizedBox(height: 20),

            const Text(
              'Welcome to Music Playlist',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {

                // Navigator + MaterialPageRoute
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlaylistScreen(),
                  ),
                );

              },
              child: const Text('Open Playlist'),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// SCREEN 2: PLAYLIST SCREEN
// ======================================================

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Playlist'),
        centerTitle: true,
      ),

      body: ListView(
        children: [

          ListTile(
            leading: const Icon(Icons.music_note),

            title: const Text(
              'Perfect',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: const Text('Ed Sheeran'),

            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),

            onTap: () {

              // Named Route
              Navigator.pushNamed(
                context,
                '/songDetails',
                arguments: {
                  'title': 'Perfect',
                  'artist': 'Ed Sheeran',
                },
              );

            },
          ),

          ListTile(
            leading: const Icon(Icons.music_note),

            title: const Text(
              'Believer',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: const Text('Imagine Dragons'),

            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),

            onTap: () {

              Navigator.pushNamed(
                context,
                '/songDetails',
                arguments: {
                  'title': 'Believer',
                  'artist': 'Imagine Dragons',
                },
              );

            },
          ),

          ListTile(
            leading: const Icon(Icons.music_note),

            title: const Text(
              'Night Changes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: const Text('One Direction'),

            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),

            onTap: () {

              Navigator.pushNamed(
                context,
                '/songDetails',
                arguments: {
                  'title': 'Night Changes',
                  'artist': 'One Direction',
                },
              );

            },
          ),
        ],
      ),
    );
  }
}

// ======================================================
// SCREEN 3: SONG DETAILS SCREEN
// ======================================================

class SongDetailsScreen extends StatelessWidget {
  const SongDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Receive arguments
    final arguments =
        ModalRoute.of(context)?.settings.arguments
            as Map<String, String>?;

    final String title =
        arguments?['title'] ?? 'Unknown Song';

    final String artist =
        arguments?['artist'] ?? 'Unknown Artist';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Song Details'),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.album,
              size: 150,
            ),

            const SizedBox(height: 30),

            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              artist,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow),
              label: const Text('Play'),
            ),
          ],
        ),
      ),
    );
  }
}