import 'package:flutter/foundation.dart';

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    @required this.userId,
    @required this.id,
    @required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,   
    );
  }
}
