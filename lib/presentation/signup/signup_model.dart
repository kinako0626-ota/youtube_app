import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpModel extends ChangeNotifier {
  String mail = '';
  String password = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //TODO: なにかの通信をするModel。。。。。ビジネスロジックなどの処理
  Future signUp() async {
    //TODO:バリデーション（メールとパスワードが空ならthrowを処理する）
    if (mail.isEmpty) {
      throw ('メールアドレスを入力してください');
    }
    if (password.isEmpty) {
      throw ('パスワードを入力してください');
    }
    //TODO:サインアップ
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: mail,
      password: password,
    ))
        .user;

    final email = user.email;
    Firestore.instance.collection('users').add(
      {
        'title': email,
        'created_at': Timestamp.now(),
      },
    );
  }
}
