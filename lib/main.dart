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

// APP COLORS
const Color primaryColor = Color(0xFF6C4AB6);
const Color backgroundColor = Color(0xFFF7F4FC);

// PROVIDER
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

// MAIN APP WITH CUSTOM THEME
class MusicPlaylistApp extends StatelessWidget {
  const MusicPlaylistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Playlist App',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 14,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// REUSABLE CUSTOM WIDGET: MUSIC ICON
class MusicIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const MusicIcon({
    super.key,
    this.icon = Icons.music_note,
    this.size = 28,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: primaryColor.withValues(alpha: 0.12),
      child: Icon(
        icon,
        size: size,
        color: primaryColor,
      ),
    );
  }
}

// REUSABLE CUSTOM WIDGET: SONG CARD
class SongCard extends StatelessWidget {
  final String title;
  final String artist;
  final VoidCallback onTap;

  const SongCard({
    super.key,
    required this.title,
    required this.artist,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: const MusicIcon(),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(artist),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
        onTap: onTap,
      ),
    );
  }
}

// REUSABLE CUSTOM WIDGET: ACTION BUTTON
class MusicActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const MusicActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}

// HOME SCREEN
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Playlist'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MusicIcon(
                icon: Icons.library_music,
                size: 55,
              ),
              const SizedBox(height: 24),
              const Text(
                'Welcome to Music Playlist',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Your favourite songs in one place',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              MusicActionButton(
                icon: Icons.queue_music,
                label: 'Open Playlist',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PlaylistScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// PLAYLIST SCREEN
class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  static const List<Map<String, String>> songs = [
    {
      'title': 'Neeli Meghamulalo',
      'artist': '35 chinna katha kaadu',
    },
    {
      'title': 'Ammadi',
      'artist': 'Kaala Bhairava',
    },
    {
      'title': 'Aaya Sher',
      'artist': 'Anirudh',
    },
    {
      'title': 'Sanam Teri Kasam',
      'artist': 'Himesh Reshammiya',
    },
    {
      'title': 'Adhento Gani Vunnapaatuga (Jersey)',
      'artist': 'Anirudh',
    },
    {
      'title': 'Him & I',
      'artist': 'Halsey & G-Eazy',
    },
    {
      'title': 'Perfect',
      'artist': 'Ed Sheeran',
    },
    {
      'title': 'Night Changes',
      'artist': 'One Direction',
    },
    {
      'title': 'Shape of You',
      'artist': 'Ed Sheeran',
    },
    {
      'title': 'Maate Raani',
      'artist': 'Illaiyaraja, S.P. Balasubramanyam, K.S. Chitra',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Playlist'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: songs.map((song) {
          return SongCard(
            title: song['title']!,
            artist: song['artist']!,
            onTap: () {
              Provider.of<MusicProvider>(
                context,
                listen: false,
              ).playSong(song['title']!);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlayerScreen(),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

// PLAYER SCREEN
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
      ),
      body: Center(
        child: Consumer<MusicProvider>(
          builder: (context, music, child) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MusicIcon(
                    icon: Icons.album,
                    size: 75,
                  ),
                  const SizedBox(height: 28),
                  Text(
                    music.currentSong,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Music Player',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 28),
                  MusicActionButton(
                    icon: music.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    label: music.isPlaying ? 'Pause' : 'Resume',
                    onPressed: music.togglePlayPause,
                  ),
                  const SizedBox(height: 12),
                  MusicActionButton(
                    icon: liked
                        ? Icons.favorite
                        : Icons.favorite_border,
                    label: liked ? 'Liked' : 'Like',
                    onPressed: () {
                      setState(() {
                        liked = !liked;
                      });
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}