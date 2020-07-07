import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtubeapp/presentation/login/login_page.dart';
import 'package:youtubeapp/presentation/signup/signup_page.dart';
import 'main_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sampleApp',
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('sampleApp'),
          ),
          body: Consumer<MainModel>(builder: (context, model, child) {
            return Center(
              child: Column(
                children: <Widget>[
                  Text(
                    model.MainText,
                    style: TextStyle(fontSize: 30),
                  ),
                  RaisedButton(
                      child: Text('新規登録'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      }),
                  RaisedButton(
                      child: Text('ログイン'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      })
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
