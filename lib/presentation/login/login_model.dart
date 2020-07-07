import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String mail = '';
  String password = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //TODO: なにかの通信をするModel。。。。。ビジネスロジックなどの処理
  // ignore: non_constant_identifier_names
  Future Login() async {
    //TODO:バリデーション（メールとパスワードが空ならthrowを処理する）
    if (mail.isEmpty) {
      throw ('メールアドレスを入力してください');
    }
    if (password.isEmpty) {
      throw ('パスワードを入力してください');
    }
    //TODO:ログイン
    final result = await _auth.signInWithEmailAndPassword(
      email: mail,
      password: password,
    );
    final uid = result.user.uid;
    //TODO:uidを端末に保存する
  }
}
