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
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      home: const PlaylistScreen(),
    );
  }
}

// ---------------- SONG MODEL ----------------

class Song {
  final String title;
  final String artist;
  final IconData icon;

  const Song({
    required this.title,
    required this.artist,
    required this.icon,
  });
}

// ---------------- PLAYLIST SCREEN ----------------

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  final List<Song> songs = const [
    Song(
      title: 'Perfect',
      artist: 'Ed Sheeran',
      icon: Icons.album,
    ),
    Song(
      title: 'Believer',
      artist: 'Imagine Dragons',
      icon: Icons.music_note,
    ),
    Song(
      title: 'Night Changes',
      artist: 'One Direction',
      icon: Icons.album,
    ),
    Song(
      title: 'Shape of You',
      artist: 'Ed Sheeran',
      icon: Icons.music_note,
    ),
    Song(
      title: 'Counting Stars',
      artist: 'OneRepublic',
      icon: Icons.album,
    ),
    Song(
      title: 'Let Me Love You',
      artist: 'DJ Snake',
      icon: Icons.music_note,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A1A2E),
              Color(0xFF16213E),
              Color(0xFF0F3460),
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double width = constraints.maxWidth;

              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width < 600 ? 18 : 60,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // HEADER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'My Playlist',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Your favourite songs 🎵',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.12),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.headphones,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // MUSIC BANNER
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFE94560),
                            Color(0xFF8E44AD),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.graphic_eq,
                            color: Colors.white,
                            size: 55,
                          ),
                          SizedBox(width: 18),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Music for your mood',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Listen • Relax • Enjoy',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      'Songs',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // SONG LIST
                    Expanded(
                      child: ListView.builder(
                        itemCount: songs.length,
                        itemBuilder: (context, index) {
                          final song = songs[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NowPlayingScreen(
                                    song: song,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.10),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.08),
                                ),
                              ),
                              child: Row(
                                children: [
                                  // MUSIC ICON
                                  Container(
                                    height: 55,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.pinkAccent.shade100,
                                          Colors.deepPurpleAccent,
                                        ],
                                      ),
                                    ),
                                    child: Icon(
                                      song.icon,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),

                                  const SizedBox(width: 15),

                                  // SONG DETAILS
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          song.title,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          song.artist,
                                          style: const TextStyle(
                                            color: Colors.white60,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const Icon(
                                    Icons.play_circle_fill,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// ---------------- NOW PLAYING SCREEN ----------------

class NowPlayingScreen extends StatefulWidget {
  final Song song;

  const NowPlayingScreen({
    super.key,
    required this.song,
  });

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  bool isPlaying = true;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF8E44AD),
              Color(0xFF1A1A2E),
              Color(0xFF0F0F1A),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                // TOP BAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'NOW PLAYING',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ],
                ),

                const Spacer(),

                // ALBUM ART
                Container(
                  height: 230,
                  width: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFE94560),
                        Color(0xFF8E44AD),
                        Color(0xFF0F3460),
                      ],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 25,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.album,
                    color: Colors.white,
                    size: 130,
                  ),
                ),

                const SizedBox(height: 35),

                // SONG NAME
                Text(
                  widget.song.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  widget.song.artist,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 17,
                  ),
                ),

                const SizedBox(height: 35),

                // PROGRESS BAR
                const LinearProgressIndicator(
                  value: 0.35,
                  minHeight: 5,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  backgroundColor: Colors.white24,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                ),

                const SizedBox(height: 8),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1:12',
                      style: TextStyle(color: Colors.white60),
                    ),
                    Text(
                      '3:52',
                      style: TextStyle(color: Colors.white60),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // CONTROLS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                      size: 40,
                    ),

                    const SizedBox(width: 25),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      },
                      child: Container(
                        height: 65,
                        width: 65,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),
                    ),

                    const SizedBox(width: 25),

                    const Icon(
                      Icons.skip_next,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // LIKE BUTTON
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isLiked
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isLiked
                            ? Colors.pinkAccent
                            : Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        isLiked ? 'Liked' : 'Like',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}