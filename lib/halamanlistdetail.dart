import 'package:flutter/material.dart';
import 'package:onigirydiary/modeldiary.dart';

class Halamanlistdetail extends StatelessWidget {
  final int id;

  Halamanlistdetail({this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(diaries[id].datePost),
          // Text(diaries[id].feeling),
          // Text(diaries[id].note),
        ],
      ),
    );
  }
}
