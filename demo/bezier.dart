import "package:flutter/material.dart";

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Scaffold(
          body: Column(
            children: <Widget>[
              ClipPath(
                clipper: MyClipper1(),
                child: Container(
                  height: 100,
                  color: Colors.pink,
                ),
              ),
              Divider(),
              ClipPath(
                clipper: MyClipper2(),
                child: Container(
                  height: 200,
                  color: Colors.red,
                ),
              ),
              ClipPath(
                clipper: MyClipper3(),
                child: Container(
                  height: 200,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// 窗帘效果
class MyClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, 0);

    path.lineTo(0, size.height - 15);
    var loopNum = (size.width ~/ 25).toInt();

    for (var j = 1; j <= loopNum; j++) {
      var i = 2 * j - 1;
      var controllerPoint = Offset(size.width * i / (loopNum * 2), size.height);
      var endpoint =
          Offset(size.width * (i + 1) / (loopNum * 2), size.height - 15);

      // print("$ControllerPoint ---- $Endpoint");

      path.quadraticBezierTo(
          controllerPoint.dx, controllerPoint.dy, endpoint.dx, endpoint.dy);
    }
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MyClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 80);

    var controllerPoint = Offset(size.width / 2, size.height);
    var endpoint = Offset(size.width, size.height - 80);
    path.quadraticBezierTo(
        controllerPoint.dx, controllerPoint.dy, endpoint.dx, endpoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}



class MyClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);

    var firstControllerPoint = Offset(size.width / 4, size.height);
    var firstEndpoint = Offset(size.width /2 , size.height - 50);
    path.quadraticBezierTo(
        firstControllerPoint.dx, firstControllerPoint.dy, firstEndpoint.dx, firstEndpoint.dy);


    var secondControllerPoint = Offset(size.width *3  / 4, size.height - 100);
    var secondEndpoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(
        secondControllerPoint.dx, secondControllerPoint.dy, secondEndpoint.dx, secondEndpoint.dy);
    path.lineTo(size.width, 0);



    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
