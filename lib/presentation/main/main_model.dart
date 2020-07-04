import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier{
  String MainText = 'ああああああ';

  void changeMainText(){
    MainText = 'おはよう！';
    //TODO:変更したことを通知するためのコード
    notifyListeners();
  }
}