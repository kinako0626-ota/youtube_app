//TODO: エンティティModel.....要素としてのモデル
import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  Book(DocumentSnapshot doc) {
    documentID = doc.documentID;
    title = doc['title'];
  }
  String documentID;
  String title;
}
