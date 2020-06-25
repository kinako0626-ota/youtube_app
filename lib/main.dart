import 'package:flutter/material.dart';

import 'next_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final items = List<String>.generate(10000, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: Icon(
              Icons.video_library,
              color: Colors.red,
          ),
          title: const Text('Waplusチャンネル'),
          actions: <Widget>[
            SizedBox(
              width: 50,
              child: FlatButton(
                child: Icon(Icons.search),
                onPressed: (){
                  //TODO:
                },
              ),
            ),
            SizedBox(
              width: 50,
              child: FlatButton(
                child: Icon(Icons.more_vert),
                onPressed: (){
                  //TODO:
                },
              ),
            )
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.network(
                          'https://yt3.ggpht.com/a/AATXAJyPMywRmD62sfK-1CXjwF0YkvrvnmaaHzs4uw=s288-c-k-c0xffffffff-no-rj-mo'
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      children: <Widget>[
                        const Text(
                            'Waplusチャンネル',
                        ),
                        FlatButton(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                  Icons.video_call,
                                  color: Colors.red,
                              ),
                              Text('登録する'),
                            ],

                          ),
                          onPressed: (){
                            //TODO:
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: (){
                        //TODO:画面遷移する
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NextPage()
                          ),
                        );
                      },
                      contentPadding: EdgeInsets.all(8),
                      leading: Image.network('https://i.ytimg.com/vi/RfKnx3ZdCac/hqdefault.jpg?sqp=-oaymwEZCNACELwBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLBfuDZ8jSRuBSBliBGXQHc9jyHv9w'),
                      title: Column(
                        children: <Widget>[
                          Text(
                              '閲覧注意！【シャドーコリドー 影の回廊】恐怖を感じない男のホラーゲーム実況④',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                  '567万回視聴',
                              style: TextStyle(fontSize: 13),
                              ),
                              Text('・'),
                              Text(
                                  '3時間前',
                              style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.more_vert,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}