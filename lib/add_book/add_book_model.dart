import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtubeapp/domain/book.dart';

class AddBookModel extends ChangeNotifier {
  //TODO: なにかの通信をするModel。。。。。ビジネスロジックなどの処理
  String bookTitle = '';

  Future addBookToFirebase() async {
    //TODO:タイトルが入力されていなければエラーを出す
    if (bookTitle.isEmpty) {
      throw ('タイトルを入力してください');
    }
    Firestore.instance.collection('books').add(
      {
        'title': bookTitle,
        'created_at': Timestamp.now(),
      },
    );
  }

//TODO:引数に取得したいDocumentオブジェクトを入れることでドキュメントを取得できる
  Future updateBook(Book book) async {
    final document =
        Firestore.instance.collection('books').document(book.documentID);
    await document.updateData(
      {
        'title': bookTitle,
        'update_at': Timestamp.now(),
      },
    );
  }
}
