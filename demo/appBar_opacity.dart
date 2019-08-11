import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "导航栏渐变",
        home: HomePage(),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {

// }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List mylist = [Colors.red, Colors.blue, Colors.green];
  double _opacity = 0.0;

  Widget _item(index) {
    return Container(height: 100, color: mylist[index % 3]);
  }

  _onscroll(offset) {
    // print(offset);

    setState(() {
      _opacity = offset / 250 > 1 ? 1.0 : offset / 250;
      _opacity = _opacity < 0 ? 0.0 : _opacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            _onscroll(scrollNotification.metrics.pixels);
            return true;
          }
          return false;
        },
        child: Stack(
          children: <Widget>[
            Container(
              height: 50,
            ),
            Container(
              height: 800,
              child: ListView.builder(
                itemCount: 16,
                itemBuilder: (context, index) => _item(index),
              ),
            ),
            Stack(
              children: <Widget>[
                Opacity(
                  opacity: _opacity,
                  child: Container(
                    width: 500,
                    height: 60,
                    color: Colors.white,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 500,
                  height: 60,
                  color: Colors.transparent,
                  child: Text(
                    "我假装是导航栏",
                    style: TextStyle(fontSize: 28),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
