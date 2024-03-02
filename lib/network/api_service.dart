import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:jeevan_diabetes_app/core/models/video_model/video.dart';

class ApiService {
  static const String uri =
      'https://hormone-wizard.domanddom.com/api/videos/home';
  static const authToken = 'Token-1d1a03971ba85b2066f505b20cb85ab4f7847eaa';

  Future<Video> fetchPopularVideos() async {
    final response = await http.get(
      Uri.parse(uri),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: authToken,
      },
    );
    // Print the raw JSON response
    print('Raw JSON Response: ${response.body}');
    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;

    // Print the parsed JSON
    print('Parsed JSON: $responseJson');
    return Video.fromJson(responseJson);
  }
}














//   var headers = {
//   'Authorization': 'Token-1d1a03971ba85b2066f505b20cb85ab4f7847eaa'
// };
// var request = http.Request('GET', Uri.parse('https://hormone-wizard.domanddom.com/api/contactus/about-us'));

// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }


