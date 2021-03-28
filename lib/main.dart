import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:onigirydiary/halamanhome.dart';
import 'package:onigirydiary/halamanlistdetail.dart';
import 'package:onigirydiary/halamansplash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDateFormatting();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onigiri App',
      home: Halamansplash(),
      debugShowCheckedModeBanner: false,
      routes: {
        // '/': (context) => Halamansplash(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => Halamansplash());
        }
        if(settings.name == 'home'){
          return MaterialPageRoute(builder: (context) => Halamanhome());
        }
        var uri = Uri.parse(settings.name);
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'detail') {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(
              builder: (context) => Halamanlistdetail(id: int.tryParse(id)));
        }
        return MaterialPageRoute(
              builder: (context) => Container());
      },
    );
  }
}
