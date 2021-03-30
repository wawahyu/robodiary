import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onigirydiary/databases/diaries_database.dart';
import 'package:onigirydiary/models/modeldiary.dart';
import 'package:onigirydiary/screens/diary/halamanedit.dart';

class Tablist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: DiariesDatabase().streamDiaries(),
      builder: _asyncSnapshot,
    );
    // return FutureBuilder<QuerySnapshot>(
    //   future: FirebaseFirestore.instance.collection('diaries').get(),
    //   builder: _asyncSnapshot,
    // );
  }

  Widget _asyncSnapshot(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      List<DocumentSnapshot> diaries = snapshot.data.docs;
      if (diaries.length > 0) {
        return _getListdiary(context, diaries);
      } else {
        return Center(child: Text('Tidak ada Data'));
      }
    } else {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Color(0xffffdede)),
        ),
      );
    }
  }

  Widget _getListdiary(BuildContext context, List<DocumentSnapshot> diaries) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: diaries.length,
      itemBuilder: (context, index) {
        ModelDiary diary = ModelDiary.fromDocumentSnapshot(diaries[index]);
        return _getEntryDiary(context, diary);
      },
    );
    // return CustomScrollView(
    //   slivers: [
    //     // SliverPadding(
    //     //   padding: EdgeInsets.symmetric(
    //     //     vertical: 4,
    //     //   ),
    //     // ),
    //     // SliverToBoxAdapter(),
    //     // SliverToBoxAdapter(
    //     //   child: Container(
    //     //     height: 120,
    //     //     width: MediaQuery.of(context).size.width,
    //     //     padding: EdgeInsets.symmetric(
    //     //       horizontal: 4,
    //     //     ),
    //     //     child: SingleChildScrollView(
    //     //       scrollDirection: Axis.horizontal,
    //     //       child: Container(
    //     //         child: Row(
    //     //           children: List.generate(20, (index) {
    //     //             return Container(
    //     //               height: 80,
    //     //               width: 140,
    //     //               margin: EdgeInsets.symmetric(
    //     //                 horizontal: 4,
    //     //               ),
    //     //               decoration: BoxDecoration(
    //     //                 borderRadius: BorderRadius.circular(10),
    //     //                 color: Colors.white,
    //     //               ),
    //     //             );
    //     //           }),
    //     //         ),
    //     //       ),
    //     //     ),
    //     //   ),
    //     // ),
    //     SliverPadding(
    //       padding: EdgeInsets.symmetric(
    //         vertical: 4,
    //       ),
    //     ),
    //     SliverGrid.count(
    //       crossAxisCount: 1,
    //       children: List.generate(diaries.length, (index) {
    //         return Container(
    //           width: MediaQuery.of(context).size.width * 45 / 100,
    //           child: _getEntryDiary(context, index),
    //         );
    //       }),
    //     ),
    //   ],
    // );
  }

  Widget _getEntryDiary(BuildContext context, ModelDiary diary) {
    return Card(
      color: Colors.yellow[50],
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        title: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 25,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        diary.feeling == 'Happy'
                            ? 'images/mdi_robot-happy.png'
                            : diary.feeling == 'Sad'
                                ? 'images/mdi_robot-angry.png'
                                : 'images/192.png',
                        height: 48,
                        color: Colors.blue[200],
                      ),
                      Text(
                        diary.feeling,
                        style: TextStyle(
                          fontFamily: 'IndieFlower',
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 75,
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 100,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 6,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 20,
                                          child: Container(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Waktu',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 70,
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ': ' +
                                                      DateFormat(
                                                              'EEEE dd MMMM yyyy',
                                                              'id')
                                                          .format(
                                                              diary.datePost)
                                                          .toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.purple[500],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 6,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 20,
                                          child: Container(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Lokasi',
                                                  style: TextStyle(
                                                    color: Colors.purple,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 70,
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ': Unknown',
                                                  style: TextStyle(
                                                    color: Colors.purple,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.purple[100],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            flex: 100,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      diary.note,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontFamily: 'IndieFlower'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HalamanEditDiary(diary),
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                              primary: Colors.black,
                            ),
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 32.0,
                          ),
                          TextButton(
                            onPressed: () => konfirmasiDialog(
                              context,
                              'Apakah anda yakin akan menghapus ini?',
                              diary.id,
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              primary: Colors.black,
                            ),
                            child: Text(
                              'Hapus',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/detail/' + diary.id, arguments: diary);
        },
      ),
    );
  }

  void konfirmasiDialog(BuildContext context, String message, String id) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Perhatian"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Ok",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () => DiariesDatabase(docId: id)
                  .deleteDiary()
                  .then((_) => Navigator.of(context).pop()),
            ),
            TextButton(
              child: Text(
                "Baltal",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
