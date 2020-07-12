import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './NewsListPage.dart';
import './OrderListPage.dart';
import './DiscoveryPage.dart';
import './MyInfoPage.dart';
import '../widgets/MyDrawer.dart';
import '../performance/PerformanceHome.dart';



class MyOSCClient extends StatefulWidget {
  String result;
  String usercode;
  MyOSCClient(this.result,this.usercode);
  @override
  State<StatefulWidget> createState() => new MyOSCClientState();
}

class MyOSCClientState extends State<MyOSCClient> {
  int _tabIndex = 0;
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));
  final tabTextStyleSelected = new TextStyle(color: const Color(0xff63ca6c));

  var tabImages;
  var _body;
  var appBarTitles = ['导航管理', '工单管理', '异常监测', '我的台区'];

  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_tweet_normal.png'),
          getTabImage('images/ic_nav_tweet_actived.png')
        ],
        [
          getTabImage('images/ic_nav_discover_normal.png'),
          getTabImage('images/ic_nav_discover_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ]
      ];
    }
    _body = new IndexedStack(
      children: <Widget>[
        new NewsListPage(),
        new TweetsListPage(),
        new DiscoveryPage(),
        new PerformanceHome()
      ],
      index: _tabIndex,
    );
  }

  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return new Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  @override
  Widget build(BuildContext context) {
    initData();
     return new Scaffold(
          appBar: new AppBar(
              title: new Text(appBarTitles[_tabIndex],
                  style: new TextStyle(color: Colors.white)),
              iconTheme: new IconThemeData(color: Colors.white),
            centerTitle: true,
          ),
          body: _body,
          bottomNavigationBar: new CupertinoTabBar(
            items: <BottomNavigationBarItem>[
              new BottomNavigationBarItem(
                  icon: getTabIcon(0),
                  title: getTabTitle(0)),//导航
              new BottomNavigationBarItem(
                  icon: getTabIcon(1),
                  title: getTabTitle(1)),//工单
              new BottomNavigationBarItem(
                  icon: getTabIcon(2),
                  title: getTabTitle(2)),//异常
              new BottomNavigationBarItem(
                  icon: getTabIcon(3),
                  title: getTabTitle(3)),//业绩
            ],
            currentIndex: _tabIndex,
            onTap: (index) {
              setState((){
                _tabIndex = index;
              });
            },
          ),
          drawer: new MyDrawer()
    );

  }
}