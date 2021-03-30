import 'package:flutter/material.dart';
import 'package:onigirydiary/databases/diaries_database.dart';

class HalamanTambahDiary extends StatefulWidget {
  @override
  _HalamanTambahDiaryState createState() => _HalamanTambahDiaryState();
}

class _HalamanTambahDiaryState extends State<HalamanTambahDiary> {
  TextEditingController _feelingController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Diary'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Text(
              'Feeling:',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            TextFormField(
              controller: _feelingController,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Tolong diisi dulu!';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Masukan Feeling',
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              'Note:',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            TextFormField(
              controller: _noteController,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Tolong diisi dulu!';
                }
                return null;
              },
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Masukan Note',
              ),
            ),
            SizedBox(height: 32.0),
            TextButton(
              onPressed: () => _onSubmit(),
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.blue,
                minimumSize: Size(
                  MediaQuery.of(context).size.width,
                  35.0,
                ),
              ),
              child: Text(
                'Simpan',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSubmit() {
    if (_formKey.currentState.validate()) {
      DiariesDatabase()
          .tambahDiary(
        feeling: _feelingController.text,
        note: _noteController.text,
      )
          .then((value) {
        Navigator.of(context).pop();
      });
    }
  }
}
