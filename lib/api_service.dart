import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<dynamic>> fetchSongs(String query) async {
    final url = Uri.https(
      'itunes.apple.com',
      '/search',
      {
        'term': query,
        'media': 'music',
        'entity': 'song',
        'limit': '20',
        'country': 'IN',
      },
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load songs');
    }
  }
}