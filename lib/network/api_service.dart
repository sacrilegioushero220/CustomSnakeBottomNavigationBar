import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:jeevan_diabetes_app/core/models/video_model/video.dart';

class ApiService {
  static const String uri =
      'https://hormone-wizard.domanddom.com/api/videos/home';
  static const authToken = 'Token-1d1a03971ba85b2066f505b20cb85ab4f7847eaa';

  Future<List<Video>> fetchPopularVideos() async {
    final response = await http.get(
      Uri.parse(uri),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: authToken,
      },
    );
    print("Response is this:$response");
    // Check if the response status code is successful
    if (response.statusCode == 200) {
      // Parse the JSON response into a list of videos
      final List<dynamic> data = json.decode(response.body)['data']['VIDEO'];
      List<Video> videos = data.map((json) => Video.fromJson(json)).toList();
      return videos;
    } else {
      // If the response is not successful, throw an error
      throw Exception('Failed to fetch videos');
    }
  }
}
