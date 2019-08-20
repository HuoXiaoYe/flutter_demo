import 'package:flutter/material.dart';
// import 'dart:math';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "音乐播放器动画",
      home: Scaffold(
        appBar: AppBar(
          title: Text("播放器播放动效"),
        ),
        body: PageHome(),
      ),
    );
  }
}

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome>
    with SingleTickerProviderStateMixin {
  AnimationController _myAnimation;
  @override
  void initState() {
    _myAnimation =
        AnimationController(duration: new Duration(seconds: 2), vsync: this)
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _myAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 

    
    Container(
      child: (Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Hero(
              tag: "music",
              child: AnimatedBuilder(
                animation: _myAnimation,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => new SecondPage()));
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      child: Image.network(
                        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566274424503&di=caabde38683e2b61300f747b20c98c6b&imgtype=0&src=http%3A%2F%2Fpic22.nipic.com%2F20120709%2F10468248_183321228117_2.jpg",
                        width: 80,
                      ),
                    ),
                  ),
                ),
                builder: (BuildContext context, Widget child) {
                  return Transform.rotate(
                    angle: _myAnimation.value * 2.0 * 3.141592638,
                    child: child,
                  );
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  AnimationController _myAnimation;
  @override
  void initState() {
    super.initState();
    _myAnimation =
        AnimationController(duration: Duration(seconds: 3), vsync: this)
          ..repeat();
  }

  @override
  void dispose() {
    _myAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("播放页面"),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.navigate_before),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            body: Center(
                child: Hero(
                    tag: "music",
                    child: AnimatedBuilder(
                      animation: _myAnimation,
                      child: Container(
                        // padding: EdgeInsets.only(top: 100, left: 50),
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(200)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(200)),
                          child: Image.network(
                            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566274424503&di=caabde38683e2b61300f747b20c98c6b&imgtype=0&src=http%3A%2F%2Fpic22.nipic.com%2F20120709%2F10468248_183321228117_2.jpg",
                            width: 300,
                          ),
                        ),
                      ),
                      builder: (BuildContext context, Widget child) {
                        return Transform.rotate(
                          angle: _myAnimation.value * 2.0 * 3.141592638,
                          child: child,
                        );
                      },
                    )))));
  }
}
