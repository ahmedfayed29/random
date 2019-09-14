import 'package:mock_data/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Generate extends StatefulWidget {
  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  String texts = 'no Code Generated';
  int num = 0;
  DateTime now = new DateTime.now();
  void showToast(String msg, {int duration, int gravity}) {
    Toast.show('this is the day', context,
        duration: 4, gravity: Toast.CENTER, backgroundColor: Colors.green);
  }

  String toast;

  void random() {
    var randomNumber = mockInteger(999000, 9000000).toString();

    var randomString = mockString(1, 'Aa');
    var places = '$randomNumber$randomString';
    setState(() {
      texts = '$places';
    });
  }

  void plus() {
    setState(() {
      if (num == now.day) {
        showToast(toast);
      } else
        num = num + 1;
    });
  }

  void min() {
    setState(() {
      if ((num - 1) < 0) {
        num = 0;
      } else
        num = num - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: new Text('Task1'),
          centerTitle: true,
        ),
        body: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new IconButton(icon: Icon(Icons.remove), onPressed: min),
                  new Text(
                    '$num',
                    style: TextStyle(fontSize: 20),
                  ),
                  new IconButton(icon: Icon(Icons.add), onPressed: plus),
                ],
              ),
              new Text('$texts'),
              new FlatButton(
                onPressed: random,
                child: new Text('Generate Code'),
                color: Colors.green,
              )
            ],
          ),
        ));
  }
}

//String texts = 'no Code Generated';
//
//var chars = "abcdefghijklmnopqrstuvwxyz";
//var numbers = '0123456789';
//String randomString(int stringLength) {
//  Random rnd = new Random();
//  String result = "";
//  for (var i = 0; i < stringLength; i++) {
//    result += chars[rnd.nextInt(chars.length)];
//  }
//  return result;
//}
//
//String randomNumbers(int stringLength) {
//  Random rnd = new Random();
//  String result = "";
//  for (var i = 0; i < stringLength; i++) {
//    result += numbers[rnd.nextInt(numbers.length)];
//  }
//  return result;
//}
//
//String randomResult(int stringLength) {
//  String result = "";
//  setState(() {
//    result = randomNumbers(7) + randomString(1);
//  });
//  return result;
//}
