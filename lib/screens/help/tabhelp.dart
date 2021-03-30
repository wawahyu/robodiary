import 'package:flutter/material.dart';

class Tabhelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Halaman Help'),),
      decoration: BoxDecoration(
        color: Color(0xffffdede),
        image: DecorationImage(
          image: AssetImage("images/mdi_robot-happy.png"),
        ),
      ),
    );
  }
}
