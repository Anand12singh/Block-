import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:blockprec/model/post_model.dart';

class PostRepo {
  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((e) {
          return PostModel(
            userId: e['userId'] as int,
            id: e['id'] as int,
            title: e['title'] as String,
            body: e['body'] as String,
          );
        }).toList();
      } else {
        // Handle non-200 responses
        throw HttpException('Failed to load posts: ${response.statusCode}');
      }
    } on SocketException {
      throw HttpException('No Internet connection');
    } on FormatException {
      throw HttpException('Bad response format');
    } catch (e) {
      // Handle any other exceptions
      throw HttpException('Unexpected error: $e');
    }
  }
}
