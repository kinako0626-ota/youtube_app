import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtubeapp/main_model.dart';

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
          body: Consumer<MainModel>(
            builder: (context, model, child) {
              return Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      model.MainText,
                      style: TextStyle(
                          fontSize: 30
                      ),
                    ),
                    RaisedButton(
                        child: Text('ボタン'),
                        onPressed:(){
                          model.changeMainText();
                        }
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}