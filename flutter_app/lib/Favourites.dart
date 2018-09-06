import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/FavoutiteItem.dart';
//import 'package:path/path.dart';
//import 'package:jaguar_client/jaguar_client.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new Favourits());

class Favourits extends StatefulWidget {
  final String _appBarTitle = "ListViewApplication";

  @override
  State<StatefulWidget> createState() {
    return new FavouritsState();
  }
}

class FavouritsState extends State<Favourits> {

  Future<String> getData() async {
    http.Response response = await http.get(
      Uri.encodeFull("https://verdant-violet.glitch.me/items")
    );
    print(response.body);
  }
  final String _appBarTitle = "ListViewFirstApplication";
  var _items = List<FavouriteItem>.generate(10, (i) => FavouriteItem(i));

  @override
  Widget build(BuildContext context) {
    getData();
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(title: new Text(_appBarTitle)),
        body: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              final item = _items[index].id;
              return Dismissible(
                  key: new Key(item.toString() + index.toString()),
                  onDismissed: (direction) {
                    setState(() {
                      _items.removeAt(index);
                    });
                  },
                  child: new FavouriteItem(index));
            }),
      ),
    );
  }
}
