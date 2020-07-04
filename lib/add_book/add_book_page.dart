import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtubeapp/domain/book.dart';
import 'add_book_model.dart';

class AddBookPage extends StatelessWidget {
  //TODO:イニシャライザーで AddBookPage({this.book});とする。{}を()内に入れて書くとエラーを出さずに処理が進む
  AddBookPage({this.book});

  //TODO:これでBookListの遷移先でBookが使える
  final Book book;

  @override
  Widget build(BuildContext context) {
    //TODO:三項演算子使うためisUpdateをbool型で定義
    final bool isUpdate = book != null;
    final textEditingController = TextEditingController();
    //TODO: if文練習のため三項演算子使わない
    if (isUpdate) {
      textEditingController.text = book.title;
    }
    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          //TODO:isUpdateがtrueなら本を編集、falseなら本を追加
          title: Text(isUpdate ? '本を編集' : '本を追加'),
        ),
        body: Consumer<AddBookModel>(builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: textEditingController,
                  onChanged: (text) {
                    //TODO:テキスト入力されたらmodel.bookTitleに代入
                    model.bookTitle = text;
                  },
                ),
                RaisedButton(
                  child: Text(isUpdate ? '編集する' : '追加する'),
                  onPressed: () async {
                    //TODO:try{}catch{}とすることでtryには成功したときの処理、catchには失敗したときの処理が走る
                    if (isUpdate) {
                      await updateBook(model, context);
                    } else {
                      await addBook(model, context);
                    }
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

//TODO:別メソッドにすることでコードの見通しよくする
  Future addBook(AddBookModel model, BuildContext context) async {
    try {
      //TODO:TextFieldに入力されたらFire Storeに本を追加する
      await model.addBookToFirebase();
      //TODO:awaitと入力することで順番に処理が走るので同時に発火してイベントを打ち消すのを防ぐことができる
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('保存しました！'),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
      //TODO:await showDialogと上に書いてあるので順番に処理が走る。そのため入力画面から元の画面へ戻れる
      Navigator.of(context).pop();
    } catch (e) {
      //TODO:addBookToFirebase内でbookTitleがnilのときにエラー文をshowDialogとして出す
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(e.toString()),
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

  Future updateBook(AddBookModel model, BuildContext context) async {
    try {
      //TODO:TextFieldに入力されたらFire Storeに本を追加する
      await model.updateBook(book);
      //TODO:awaitと入力することで順番に処理が走るので同時に発火してイベントを打ち消すのを防ぐことができる
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('更新しました！'),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
      //TODO:await showDialogと上に書いてあるので順番に処理が走る。そのため入力画面から元の画面へ戻れる
      Navigator.of(context).pop();
    } catch (e) {
      //TODO:addBookToFirebase内でbookTitleがnilのときにエラー文をshowDialogとして出す
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(e.toString()),
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
}
