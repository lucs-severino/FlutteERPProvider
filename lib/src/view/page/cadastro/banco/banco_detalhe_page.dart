import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BancoDetalhePage extends StatelessWidget {
  final banco;

  BancoDetalhePage({this.banco, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.amber,
        platform: Theme.of(context).platform,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('teste'),
          actions: [
            FlatButton(
              child: Icon(Icons.delete, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('lucas teste'),
            ],
          ),
        ),
      ),
    );
  }
}
