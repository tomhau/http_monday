import 'package:flutter/material.dart';
import 'package:http_wednesday/albums.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'HTTP Demo';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        
        body: Center(
          child: AlbumsPage()
        ),
      ),
    );
  }
}