import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtubeapp/domain/book.dart';

class BookListModel extends ChangeNotifier {
  //TODO: なにかの通信をするModel。。。。。ビジネスロジックなどの処理
  List<Book> books = [];

  Future fetchBooks() async {
    final docs = await Firestore.instance.collection('books').getDocuments();
    final books = docs.documents.map((doc) => Book(doc)).toList();
    this.books = books;
    notifyListeners();
  }

  Future deleteBook(Book book) async {
    await Firestore.instance
        .collection('books')
        .document(book.documentID)
        .delete();
  }
}
