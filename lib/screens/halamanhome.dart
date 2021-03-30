import 'package:flutter/material.dart';
import 'package:onigirydiary/screens/diary/halamantambah.dart';
import 'package:onigirydiary/screens/help/tabhelp.dart';
import 'package:onigirydiary/screens/diary/tablist.dart';

class Halamanhome extends StatefulWidget {
  @override
  _HalamanhomeState createState() => _HalamanhomeState();
}

class _HalamanhomeState extends State<Halamanhome> {
  PageController _controller;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  void _bottomNavbarDipijit(int page) {
    _controller.animateToPage(
      page,
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffdede),
        title: Image.asset("images/192.png", height: 48),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HalamanTambahDiary(),
          ),
        ),
      ),
      body: PageView(
        children: [
          Tablist(),
          Center(
            child: Text("Halaman dua"),
          ),
          Center(
            child: Text("Halaman tiga"),
          ),
          Tabhelp(),
        ],
        controller: _controller,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Diary'),
          BottomNavigationBarItem(icon: Icon(Icons.wb_sunny), label: 'Tips'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Kalender'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Help'),
        ],
        onTap: _bottomNavbarDipijit,
        currentIndex: _page,
      ),
    );
  }
}
