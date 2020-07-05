import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtubeapp/presentation/add_book/add_book_page.dart';
import 'package:youtubeapp/domain/book.dart';

import 'book_list_model.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本一覧'),
        ),
        body: Consumer<BookListModel>(builder: (context, model, child) {
          final books = model.books;
          final listTiles = books
              .map(
                (book) => ListTile(
                  title: Text(book.title),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      //TODO:編集画面に遷移
                      //TODO:bookオブジェクトに値をaddBookPageに渡して更新する。
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddBookPage(
                            //TODO:addBookPageで定義したbookというパラメータを追加できるようになる
                            book: book,
                          ),
                          fullscreenDialog: true,
                        ),
                      );
                      //TODO:model.fetchBooks();とすることで、遷移先から戻ってきたときにFire Storeのデータを再度取得してくれる
                      model.fetchBooks();
                    },
                  ),
                  onLongPress: () async {
                    //TODO:ここで削除の処理
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('${book.title}を削除しますか?'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('OK'),
                                onPressed: () async {
                                  Navigator.of(context).pop();

                                  //TODO: 削除のAPIを叩く
                                  //TODO: deleteBookの引数でcontext, model, bookを渡してあげる
                                  await deleteBook(context, model, book);
                                },
                              ),
                            ],
                          );
                        });
                  },
                ),
              )
              .toList();
          return ListView(
            children: listTiles,
          );
        }),
        floatingActionButton:
            Consumer<BookListModel>(builder: (context, model, child) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              //todo:
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddBookPage(),
                  fullscreenDialog: true,
                ),
              );
              //TODO:model.fetchBooks();とすることで、遷移先から戻ってきたときにFire Storeのデータを再度取得してくれる
              model.fetchBooks();
            },
          );
        }),
      ),
    );
  }

  Future deleteBook(
      BuildContext context, BookListModel model, Book book) async {
    try {
      //TODO:TextFieldに入力されたらFire Storeに本を追加する
      await model.deleteBook(book);
      //TODO:model.fetchBooks();で画面を更新。
      await model.fetchBooks();
      //TODO:awaitと入力することで順番に処理が走るので同時に発火してイベントを打ち消すのを防ぐことができる
    } catch (e) {
      //TODO:addBookToFirebase内でbookTitleがnilのときにエラー文をshowDialogとして出す
      _showDialog(context, e.toString());
    }
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
