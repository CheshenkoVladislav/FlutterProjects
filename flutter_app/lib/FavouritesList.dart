import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/FavoutiteItem.dart';
import 'package:http/http.dart' as http;

class FavouritList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FavouritState();
  }
}

class FavouritState extends State<FavouritList> {
  List _items = new List();

  Future getData() async {
    final response = await http.get(
        Uri.encodeFull('http://api.dressmeapp.ru/v2/favorites/list?'),
        headers: {
          "Accept":
              "	text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
        });
    if (response.statusCode == 200) {
      setState(() {
        print("SET STATE");
        _items = json.decode(response.body);
      });
      print("SUCCESS!!!");
      print(_items);
      return true;
    } else {
      throw Exception('FAILED HTTP RESPONSE');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _items == null ? 0 : _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Dismissible(
              key: new Key(item.toString() + index.toString()),
              onDismissed: (direction) {
                setState(() {
                  _items.removeAt(index);
                });
              },
              child: new FavouriteItem.fromNetwork(
                  _items[index]['id'],
                  _items[index]['name'],
                  _items[index]['thumbnail'].toString()));
        });
  }

  @override
  void initState() {
    getData();
  }
}
