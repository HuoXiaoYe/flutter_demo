import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: BottomAppDemo(),
    );
  }
}

class BottomAppDemo extends StatefulWidget {
  @override
  _BottomAppDemoState createState() => _BottomAppDemoState();
}

class _BottomAppDemoState extends State<BottomAppDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  double _startY;
  List colorArr = [Colors.red, Colors.pink, Colors.orange, Colors.purple];
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(milliseconds: 300),
        lowerBound: -70,
        upperBound: 0,
        vsync: this);
        
    _animationController.addListener(() {
      setState(() {});
      // print(_animationController.value);
    });
    
  }

  Widget _item(index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: colorArr[index % 4],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("知乎底部导航栏实现效果"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Listener(
            onPointerDown: (argv) {
              // print(argv.position.dy);
              setState(() {
                _startY = argv.position.dy;
              });
            },
            onPointerMove: (argv) {
              // print("onPointerMove=====${argv.position.dy}");
              if (argv.position.dy < _startY) {
                // 上滑动隐藏导航栏
                _animationController.reverse();
              } else if (argv.position.dy > _startY) {
                // 下滑动显示导航栏
                _animationController.forward();
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.red,
              child: ListView.builder(
                itemCount: 16,
                itemBuilder: (context, index) => _item(index),
              ),
            ),
          ),
          Positioned(
            bottom: _animationController.value,
            // bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text(
                "我假装是底部的导航栏",
                style: TextStyle(fontSize: 30),
              ),
            ),
          )
        ],
      ),
    );
  }
}
