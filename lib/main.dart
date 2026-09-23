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

      home: const HomeScreen(),
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
              'Neeli Meghamulalo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: const Text('35 chinna katha kaadu'),

            trailing: const Icon(Icons.arrow_forward_ios),

            onTap: () {
              Provider.of<MusicProvider>(
                context,
                listen: false,
              ).playSong('Neeli Meghamulalo');

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlayerScreen(),
                ),
              );
            },
          ),

          // SONG 2
          ListTile(
            leading: const Icon(Icons.music_note),

            title: const Text(
              'Ammadi',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: const Text('Kaala Bhairava'),

            trailing: const Icon(Icons.arrow_forward_ios),

            onTap: () {
              Provider.of<MusicProvider>(
                context,
                listen: false,
              ).playSong('Ammadi');

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlayerScreen(),
                ),
              );
            },
          ),

          // SONG 3
          ListTile(
            leading: const Icon(Icons.music_note),

            title: const Text(
              'Aaya Sher',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: const Text('Anirudh'),

            trailing: const Icon(Icons.arrow_forward_ios),

            onTap: () {
              Provider.of<MusicProvider>(
                context,
                listen: false,
              ).playSong('Aaya Sher');

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlayerScreen(),
                ),
              );
            },
          ),

          // SONG 4
          ListTile(
            leading: const Icon(Icons.music_note),

            title: const Text(
              'Sanam Teri Kasam',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: const Text('Himesh Reshammiya'),

            trailing: const Icon(Icons.arrow_forward_ios),

            onTap: () {
              Provider.of<MusicProvider>(
                context,
                listen: false,
              ).playSong('Sanam Teri Kasam');

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlayerScreen(),
                ),
              );
            },
          ),

          // SONG 5
          ListTile(
            leading: const Icon(Icons.music_note),

            title: const Text(
              'Adhento Gani Vunnapaatuga(Jersey)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: const Text('Anirudh'),

            trailing: const Icon(Icons.arrow_forward_ios),

            onTap: () {
              Provider.of<MusicProvider>(
                context,
                listen: false,
              ).playSong('Adhento Gani Vunnapaatuga');

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlayerScreen(),
                ),
              );
            },
          ),

          // SONG 6
          ListTile(
            leading: const Icon(Icons.music_note),

            title: const Text(
              'Him & I',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: const Text('Halsey & G-Eazy'),

            trailing: const Icon(Icons.arrow_forward_ios),

            onTap: () {
              Provider.of<MusicProvider>(
                context,
                listen: false,
              ).playSong('Him & I');

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlayerScreen(),
                ),
              );
            },
          ),

             ListTile(
            leading: const Icon(Icons.music_note),

            title: const Text(
              'Perfect',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: const Text('Ed Sheeran'),

            trailing: const Icon(Icons.arrow_forward_ios),

            onTap: () {
              Provider.of<MusicProvider>(
                context,
                listen: false,
              ).playSong('Perfect');

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlayerScreen(),
                ),
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

            trailing: const Icon(Icons.arrow_forward_ios),

            onTap: () {
              Provider.of<MusicProvider>(
                context,
                listen: false,
              ).playSong('Night Changes');

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlayerScreen(),
                ),
              );
            },
          ),

             ListTile(
            leading: const Icon(Icons.music_note),

            title: const Text(
              'Shape of You',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: const Text('Ed Sheeran'),

            trailing: const Icon(Icons.arrow_forward_ios),

            onTap: () {
              Provider.of<MusicProvider>(
                context,
                listen: false,
              ).playSong('Shape of You');

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlayerScreen(),
                ),
              );
            },
          ),

          // SONG 7
          ListTile(
            leading: const Icon(Icons.music_note),

            title: const Text(
              'Maate Raani',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: const Text('Illaiyaraja,S.P.Balasubramanyam,K.S.chitra'),

            trailing: const Icon(Icons.arrow_forward_ios),

            onTap: () {
              Provider.of<MusicProvider>(
                context,
                listen: false,
              ).playSong('Maate Raani');

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlayerScreen(),
                ),
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
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 30),

                // PROVIDER: PLAY / PAUSE
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

                // SETSTATE: LIKE / UNLIKE
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