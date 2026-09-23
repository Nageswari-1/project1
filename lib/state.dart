import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MusicProvider(),
      child: const MusicPlaylistApp(),
    ),
  );
}

// ======================================================
// PROVIDER - STATE MANAGEMENT
// ======================================================

class MusicProvider extends ChangeNotifier {
  String currentSong = 'No song selected';
  bool isPlaying = false;

  void playSong(String song) {
    currentSong = song;
    isPlaying = true;

    notifyListeners();
  }

  void pauseSong() {
    isPlaying = false;

    notifyListeners();
  }

  void togglePlayPause() {
    isPlaying = !isPlaying;

    notifyListeners();
  }
}

// ======================================================
// MAIN APP - STATELESS WIDGET
// ======================================================

class MusicPlaylistApp extends StatelessWidget {
  const MusicPlaylistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Playlist App',

      initialRoute: '/',

      routes: {
        '/': (context) => const HomeScreen(),
        '/playlist': (context) => const PlaylistScreen(),
        '/player': (context) => const PlayerScreen(),
      },
    );
  }
}

// ======================================================
// HOME SCREEN - STATELESS WIDGET
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
                Navigator.pushNamed(
                  context,
                  '/playlist',
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
// PLAYLIST SCREEN - STATELESS WIDGET
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
          // SONG 1
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
              Provider.of<MusicProvider>(
                context,
                listen: false,
              ).playSong('Perfect');

              Navigator.pushNamed(
                context,
                '/player',
              );
            },
          ),

          // SONG 2
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
              Provider.of<MusicProvider>(
                context,
                listen: false,
              ).playSong('Believer');

              Navigator.pushNamed(
                context,
                '/player',
              );
            },
          ),

          // SONG 3
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
              Provider.of<MusicProvider>(
                context,
                listen: false,
              ).playSong('Night Changes');

              Navigator.pushNamed(
                context,
                '/player',
              );
            },
          ),
        ],
      ),
    );
  }
}

// ======================================================
// PLAYER SCREEN - STATEFUL WIDGET
// ======================================================

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing'),
        centerTitle: true,
      ),

      body: Center(
        child: Consumer<MusicProvider>(
          builder: (context, music, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Icon(
                  Icons.album,
                  size: 150,
                ),

                const SizedBox(height: 30),

                Text(
                  music.currentSong,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Music Player',
                  style: TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 30),

                // PAUSE / RESUME
                ElevatedButton.icon(
                  onPressed: () {
                    music.togglePlayPause();
                  },

                  icon: Icon(
                    music.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),

                  label: Text(
                    music.isPlaying
                        ? 'Pause'
                        : 'Resume',
                  ),
                ),

                const SizedBox(height: 20),

                // LIKE
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      liked = !liked;
                    });
                  },

                  icon: Icon(
                    liked
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),

                  label: Text(
                    liked
                        ? 'Liked'
                        : 'Like',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}