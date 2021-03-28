import 'package:flutter/material.dart';

class Halamanpolos extends StatefulWidget {
  @override
  _HalamanpolosState createState() => _HalamanpolosState();
}

class _HalamanpolosState extends State<Halamanpolos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Center(
        child: Text('Content here.'),
      ),
    );
  }
}
