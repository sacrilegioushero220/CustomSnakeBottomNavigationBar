import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:jeevan_diabetes_app/core/models/models.dart';

class ApiService {
  static const authToken = 'Token-1d1a03971ba85b2066f505b20cb85ab4f7847eaa';
  static const String baseUri = 'https://hormone-wizard.domanddom.com/api';

  // Endpoints
  static const String homeVideosUri = '$baseUri/videos/home';
  static const String categoryListUri = '$baseUri/category/category-list';
  static const String contactUsUri = '$baseUri/contactus/contact-us';
  static const String aboutUsUri = '$baseUri/contactus/about-us';
  static const String searchVideosUri = "$baseUri/videos/search";

  Future<List<Video>> fetchPopularVideos() async {
    final response = await _get(homeVideosUri);
    // Parse the JSON response into a list of videos
    final List<dynamic> data = json.decode(response.body)['data']['VIDEO'];
    return data.map((json) => Video.fromJson(json)).toList();
  }

  Future<List<Category>> fetchCategoryList() async {
    final response = await _get(categoryListUri);
    // Parse the JSON response into a list of categories
    final List<dynamic> data = json.decode(response.body)['data']['CATEGORY'];
    return data.map((json) => Category.fromJson(json)).toList();
  }

  Future<List<AboutUs>> fetchAboutUs() async {
    final response = await _get(aboutUsUri);
    // Parse the JSON response into a list of AboutUs

    final Map<String, dynamic> responseData =
        json.decode(response.body)['data']['ABOUTUS'];
    final aboutUs = AboutUs.fromJson(responseData);
    return [aboutUs];
  }

  Future<ContactUs> fetchContactUs() async {
    final response = await _get(contactUsUri);
    // Parse the JSON response into a list of AboutUs

    final Map<String, dynamic> responseData =
        json.decode(response.body)['data']['CONTACTUS'];
    final contactUs = ContactUs.fromJson(responseData);
    return contactUs;
  }

  Future<List<Video>> searchVideos(String keyword) async {
    final response = await _post(searchVideosUri, {'keyword': keyword});
    final List<dynamic> data = json.decode(response.body)['data']['Video'];
    return data.map((json) => Video.fromJson(json)).toList();
  }

  // Generic method to perform HTTP GET requests
  Future<http.Response> _get(String uri) async {
    final response = await http.get(
      Uri.parse(uri),
      // Send authorization headers to the backend.
      headers: {HttpHeaders.authorizationHeader: authToken},
    );

    // Check if the response status code is successful
    if (response.statusCode == 200) {
      return response;
    } else {
      // If the response is not successful, throw an error
      throw Exception('Failed to fetch data');
    }
  }

  // Generic method to perform HTTP POST requests
  Future<http.Response> _post(String uri, Map<String, String> body) async {
    final response = await http.post(
      Uri.parse(uri),
      headers: {
        HttpHeaders.authorizationHeader: authToken,
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
