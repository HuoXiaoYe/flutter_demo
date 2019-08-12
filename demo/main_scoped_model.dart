import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  List data = ['孙悟空', "猪八戒", "沙悟净", "小白龙"];

  Widget _item(item, model) {
    return FlatButton(
      onPressed: () {
        model.changeMsg(item);
      },
      child: Text(item),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MsgModel(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.yellow),
        home: Scaffold(
            body: Container(
          width: 950,
          height: 800,
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                child: ScopedModelDescendant<MsgModel>(
                  builder: (context, child, model) {
                    return Text(model.msg);
                  },
                ),
              ),
              ScopedModelDescendant<MsgModel>(
                builder: (BuildContext context, child, model) {
                  return Row(
                    children: data.map((item)=>_item(item, model)).toList(),
                  );
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class MsgModel extends Model {
  String _msg = "ori value";
  String get msg => _msg;

  void changeMsg(newval) {
    _msg = newval;
    notifyListeners();
  }
}
