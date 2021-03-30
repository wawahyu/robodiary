import 'package:cloud_firestore/cloud_firestore.dart';

class ModelDiary {
  final String id;
  final String userID;
  final String feeling;
  final DateTime datePost;
  final String note;
  const ModelDiary(
      {this.id, this.userID, this.feeling, this.note, this.datePost});

  factory ModelDiary.fromDocumentSnapshot(DocumentSnapshot diary) {
    Map dataDiary = diary.data();
    return ModelDiary(
      id: diary.id,
      userID: dataDiary['user_id'] ?? '',
      feeling: dataDiary['feeling'] ?? '',
      note: dataDiary['note'] ?? '',
      datePost:
          dataDiary['datepost'] != null && dataDiary['datepost'] is Timestamp
              ? Timestamp(dataDiary['datepost'].seconds,
                      dataDiary['datepost'].nanoseconds)
                  .toDate()
              : null,
    );
  }
}
