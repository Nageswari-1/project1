import 'package:flutter/material.dart';
import 'api_service.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  final ApiService apiService = ApiService();

  final TextEditingController searchController =
      TextEditingController(text: 'Arijit Singh');

  List<dynamic> songs = [];
  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    searchSongs();
  }

  Future<void> searchSongs() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final result =
          await apiService.fetchSongs(searchController.text);

      if (!mounted) return;

      setState(() {
        songs = result;
        isLoading = false;
      });
    } catch (error) {
      if (!mounted) return;

      setState(() {
        errorMessage = 'Unable to load songs. Check your internet.';
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Music Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search songs or artists',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: searchSongs,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onSubmitted: (_) => searchSongs(),
            ),
            const SizedBox(height: 20),
            if (isLoading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            else if (errorMessage != null)
              Expanded(
                child: Center(
                  child: Text(errorMessage!),
                ),
              )
            else if (songs.isEmpty)
              const Expanded(
                child: Center(
                  child: Text('No songs found'),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: songs.length,
                  itemBuilder: (context, index) {
                    final song = songs[index];

                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: song['artworkUrl100'] != null
                            ? Image.network(
                                song['artworkUrl100'],
                                width: 55,
                                height: 55,
                                fit: BoxFit.cover,
                              )
                            : const Icon(Icons.music_note),
                        title: Text(
                          song['trackName'] ?? 'Unknown Song',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          song['artistName'] ?? 'Unknown Artist',
                        ),
                        trailing: const Icon(
                          Icons.music_note,
                          color: Color(0xFF6C4AB6),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}