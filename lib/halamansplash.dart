import 'dart:async';

import 'package:flutter/material.dart';

class Halamansplash extends StatefulWidget {
  @override
  _HalamansplashState createState() => _HalamansplashState();
}

class _HalamansplashState extends State<Halamansplash> {
  
  startTimer()async{
    var _durasi = Duration(seconds: 2);
    return Timer(_durasi, pindahHalamanHome);
  }

  void pindahHalamanHome(){
    Navigator.pushReplacementNamed(context, 'home');
  }
  

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/192.png'),
              width: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.event),
                Text(
                  'Your Cute Simple Jurnal',
                  style: TextStyle(
                    fontFamily: 'IndieFlower',
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/192.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
