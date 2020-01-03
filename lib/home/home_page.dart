import 'package:flutter/material.dart';

import 'model/commite_model.dart';
import 'service/home_service.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future _futureGitCommit;
  final HomePageService _homePageService = HomePageService();

  @override
  void initState() {
    _futureGitCommit = _homePageService.getCommitHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<ListCommitHistoryModel>(
        future: _futureGitCommit,
        builder: (BuildContext context,
            AsyncSnapshot<ListCommitHistoryModel> snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Container(
                  child: Center(
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white))));
              break;
            case ConnectionState.done:
              print('---....>>> ${snapShot.data.listCommitHistory}');
              List<CommitHistoryModel> _lisCommitHistory =
                  snapShot.data.listCommitHistory;

              if (_lisCommitHistory.length == 0) {
                return Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Your git commit history is empty',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              } else {

                return Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _lisCommitHistory.length,
                    itemBuilder: (BuildContext context, int index) {
                      DateTime _dateTime = _lisCommitHistory[index].commit.author.date ?? DateTime.now();
                      String _commitDate = '${_dateTime.month}/${_dateTime.day}/${_dateTime.year}';
                      return Card(
                        color: Colors.black,
                        child: ListTile(
                          onTap: () {},
                          contentPadding: EdgeInsets.all(10),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(height: 6),
                              Text(
                                '${_lisCommitHistory[index].commit.message ?? ""}',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                '${_lisCommitHistory[index].commit.author.name ?? ""}'
                                    ' commited on $_commitDate',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              break;
            default:
              return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _futureGitCommit = _homePageService.getCommitHistory();
        },
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
