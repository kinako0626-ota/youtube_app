import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:youtubeapp/domain/book.dart';
import 'package:youtubeapp/presentation/signup/signup_model.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    final passwordController = TextEditingController();
    return ChangeNotifierProvider<SignUpModel>(
      create: (_) => SignUpModel(),
      child: Scaffold(
        appBar: AppBar(
          //TODO:isUpdateがtrueなら本を編集、falseなら本を追加
          title: Text('サインアップ'),
        ),
        body: Consumer<SignUpModel>(builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: mailController,
                  decoration: InputDecoration(
                    hintText: 'example@sample.com',
                  ),
                  onChanged: (text) {
                    //TODO:テキスト入力されたらmodel.bookTitleに代入
                    model.mail = text;
                  },
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'パスワードを入力してください',
                  ),
                  obscureText: true,
                  onChanged: (text) {
                    //TODO:テキスト入力されたらmodel.bookTitleに代入
                    model.password = text;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                    child: Text('登録する'),
                    onPressed: () async {
                      //TODO:try{}catch{}とすることでtryには成功したときの処理、catchには失敗したときの処理が走る
                      try {
                        //TODO:
                        await model.signUp();
                        _showDialog(context, '登録完了しました');
                      } catch (e) {
                        //TODO:
                        _showDialog(context, e.toString());
                      }
                      await model.signUp();
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Future _showDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
