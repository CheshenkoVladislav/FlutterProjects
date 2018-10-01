import 'package:flutter/material.dart';
import 'package:flutter_app/mainScreens/FavouriteItemMain.dart';
import 'package:flutter_app/FavouritesList.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  final String _appBarTitle = "Избранное";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/',
      routes: {
        '/second' :  (context) => new FavouriteIemMain()
      },
      home: new Scaffold(
        appBar: new AppBar(
            title: new Center(child:
            new Text(_appBarTitle))),
        body: new FavouriteList()
      )
    );
  }
}