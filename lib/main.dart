import 'package:flutter/material.dart';
import 'package:hacker_news/src/article.dart';
import 'package:url_launcher/url_launcher.dart' as url;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primaryColor: Colors.red,
        primarySwatch: Colors.red,
      ),
      title: 'hacker news',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Hacker News'),
          ),
        ),
        body: HackerNews(),
      ),
    );
  }
}

class HackerNews extends StatefulWidget {
  @override
  _HackerNewsState createState() => _HackerNewsState();
}

class _HackerNewsState extends State<HackerNews> {
  List<Article> _article = articles;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _article.map(_buildItem).toList(),
    );
  }

  Widget _buildItem(Article e) {
    String fakeUrl = 'http://${e.domain}';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7.5,),
      child: ExpansionTile(
        backgroundColor: Colors.lightGreenAccent,
        title: Text(
          e.text,
          style: TextStyle(
            fontSize: 24.0,
          ),
          
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('${e.commentsCount} comments'),
              IconButton(
                icon: Icon(Icons.launch),
                onPressed: () async {
                  if (await url.canLaunch(fakeUrl)) {
                    url.launch(fakeUrl);
                  }
                  //and yes I did it myself, didn't copy it over stackOverFlow
                  ///
                  ///
                  ///LIKE BOY I spent like 3 hours just to grasp the Idea of future/
                  ///async/await and all of this crazy stuff
                  ///you made me question my whole life lmao.
                  ///
                  ///
                  ///
                  ///if you read this sent me 'Linux' just to know that I'm not talking
                  ///to myself
                  ///hopefully...
                  ///
                  ///
                },
              ),
              Text('by: ${e.by}',),
            ],
          ),
        ],
      ),
    );
  }
}
