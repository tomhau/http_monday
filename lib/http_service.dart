import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'model.dart';

class HttpService {
  final String albumsURL = "https://jsonplaceholder.typicode.com/albums";

  Future<List<Album>> getAlbums() async {
   
   Response res = await get(Uri.parse(albumsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Album> albums = body
        .map(
          (dynamic item) => Album.fromJson(item),
        )
        .toList();

      return albums;
    } else {
      throw "Unable to retrieve albums.";
    }
  }
Future<Album> insertAlbum(String userId, String id,String title) async {
  final response = await post(
    Uri.parse(albumsURL),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'userId': userId,
      'id':id,
      'title':title
    }
    ),  
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
}