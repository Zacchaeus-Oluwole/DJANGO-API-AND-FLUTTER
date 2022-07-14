import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<Post> fetchDetail(String id) async {
  final response = await http.get(
    Uri.parse('https://blog-api-369.herokuapp.com/api/$id/'),
  );
  if(response.statusCode == 200){
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('failed to load detail');
  }
}

Future<List<Post>> fetchPost() async {
  final response = await http.get(
    Uri.parse('https://blog-api-369.herokuapp.com/api/')
  );
  if(response.statusCode == 200){
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  } else {
    throw Exception("Failed to fetch post");
  }
}

class Post {
  final int id;
  final String title;
  final String body;
  final String image;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.image
  });

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      image: json['image'],
    );
  }
}