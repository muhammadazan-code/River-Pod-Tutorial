import 'dart:convert';

import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart' as http;

class PostModel {
  final int id;
  final int userId;
  final String title;
  final String body;

  PostModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }
}

final postProvider = FutureProvider<List<PostModel>>((ref) async {
  try {
    final uri = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      List<PostModel> postList = data
          .map((e) => PostModel.fromJson(e))
          .toList();
      return postList;
    } else {
      throw "Something went wrong";
    }
  } catch (e) {
    throw Exception("Error: $e");
  }
});
