import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/Favourite.dart';
import 'package:flutter_app/FavouriteItemMain.dart';
import 'package:flutter_app/FavouritesList.dart';
import 'package:flutter_app/FavoutiteItem.dart';

//import 'package:path/path.dart';
//import 'package:jaguar_client/jaguar_client.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  final String _appBarTitle = "ListViewApplication";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/',
      routes: {
        '/second' :  (context) => FavouriteItemMain()
      },
      home: new Scaffold(
        appBar: new AppBar(
            title: new Text(_appBarTitle)),
        body: new FavouritList()
      )
    );
  }
}