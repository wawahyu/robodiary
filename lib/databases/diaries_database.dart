import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DiariesDatabase {
  final String docId;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DiariesDatabase({this.docId});

  // Stream ke collection diaries
  Stream<QuerySnapshot> streamDiaries() {
    return _firestore.collection('diaries').snapshots();
  }

  // Untuk Tambah ke collection diaries
  Future tambahDiary({
    @required String feeling,
    @required String note,
  }) async {
    try {
      return await _firestore.collection('diaries').add({
        'feeling': feeling,
        'note': note,
        'datepost': DateTime.now(),
      });
    } catch (e) {
      print(e);
    }
  }

  // Untuk Edit ke collection diaries
  Future updateDiary(Map<String, dynamic> data) async {
    try {
      return await _firestore
          .collection('diaries')
          .doc(this.docId)
          .update(data);
    } catch (e) {
      print(e);
    }
  }

  // Untuk Delete ke collection diaries
  Future deleteDiary() async {
    try {
      return await _firestore.collection('diaries').doc(this.docId).delete();
    } catch (e) {
      print(e);
    }
  }
}
