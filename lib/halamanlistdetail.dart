import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onigirydiary/modeldiary.dart';

class Halamanlistdetail extends StatelessWidget {
  final int id;
  final ModelDiary diary;

  Halamanlistdetail({this.id, this.diary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffdede),
        title: Image.asset("images/192.png", height: 48),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        ': ' +
                                                            (diary.datePost !=
                                                                    null
                                                                ? DateFormat(
                                                                        'EEEE dd MMMM yyyy',
                                                                        'id')
                                                                    .format(diary
                                                                        .datePost)
                                                                    .toString()
                                                                : ' - '),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                        CrossAxisAlignment
                                                            .start,
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
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
