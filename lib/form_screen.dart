import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  final songController = TextEditingController();
  final artistController = TextEditingController();
  final albumController = TextEditingController();
  final durationController = TextEditingController();

  String selectedGenre = 'Pop';

  final List<String> genres = [
    'Pop',
    'Rock',
    'Classical',
    'Melody',
    'Hip Hop',
    'Jazz',
  ];

  @override
  void dispose() {
    songController.dispose();
    artistController.dispose();
    albumController.dispose();
    durationController.dispose();
    super.dispose();
  }

  void addSong() {
    if (_formKey.currentState!.validate()) {
      final newSong = {
        'title': songController.text.trim(),
        'artist': artistController.text.trim(),
        'album': albumController.text.trim(),
        'duration': durationController.text.trim(),
        'genre': selectedGenre,
      };

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${newSong['title']} added successfully!',
          ),
          backgroundColor: Colors.green,
        ),
      );

      _formKey.currentState!.reset();

      songController.clear();
      artistController.clear();
      albumController.clear();
      durationController.clear();

      setState(() {
        selectedGenre = 'Pop';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Song'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.library_music,
                size: 85,
                color: Color(0xFF6C4AB6),
              ),

              const SizedBox(height: 12),

              const Text(
                'Add Your Favourite Song',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              // Song Title
              TextFormField(
                controller: songController,
                decoration: const InputDecoration(
                  labelText: 'Song Title',
                  prefixIcon: Icon(Icons.music_note),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter song title';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Artist Name
              TextFormField(
                controller: artistController,
                decoration: const InputDecoration(
                  labelText: 'Artist Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter artist name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Album Name
              TextFormField(
                controller: albumController,
                decoration: const InputDecoration(
                  labelText: 'Album Name',
                  prefixIcon: Icon(Icons.album),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter album name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Duration
              TextFormField(
                controller: durationController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Duration (minutes)',
                  hintText: 'Example: 4.25',
                  prefixIcon: Icon(Icons.timer),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter song duration';
                  }
                  final duration = double.tryParse(value.trim());
                  if (duration == null || duration <= 0) {
                    return 'Enter a valid duration';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Genre Dropdown
              DropdownButtonFormField<String>(
                initialValue: selectedGenre,
                decoration: const InputDecoration(
                  labelText: 'Music Genre',
                  prefixIcon: Icon(Icons.category),
                  border: OutlineInputBorder(),
                ),
                items: genres.map((genre) {
                  return DropdownMenuItem(
                    value: genre,
                    child: Text(genre),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedGenre = value;
                    });
                  }
                },
              ),

              const SizedBox(height: 30),

              // Add Song Button
              ElevatedButton.icon(
                onPressed: addSong,
                icon: const Icon(Icons.add),
                label: const Text('Add Song'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C4AB6),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}