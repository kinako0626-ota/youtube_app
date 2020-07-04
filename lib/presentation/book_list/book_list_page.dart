import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtubeapp/add_book/add_book_page.dart';

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
}
