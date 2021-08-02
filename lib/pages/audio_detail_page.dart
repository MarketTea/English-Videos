import 'package:english_videos/models/photo.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Photo photo;

  DetailPage(this.photo);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // title: 'Flutter Demo',
      // theme: ThemeData(),
      body: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text('Detail audio page'),
        ),
      ),
    );
  }
}
