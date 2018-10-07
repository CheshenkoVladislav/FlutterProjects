import 'package:flutter/material.dart';
import 'package:menu/managers/networkManager.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Cities extends StatefulWidget {
  final NetworkManager _networkManager = new NetworkManager();

  @override
  State<StatefulWidget> createState() {
    return new _CitiesState(_networkManager);
  }
}

class _CitiesState extends State<Cities> {
  List _items;
  final NetworkManager _networkManager;

  _CitiesState(this._networkManager);

  @override
  Widget build(BuildContext context) {
    if (_items != null) print("count: $_items");
    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(title: new Text("CITIES")),
            body: ListView.builder(
                itemCount: _items == null ? 0 : _items.length,
                itemBuilder: (context, position) {
                  return new Material(
                      color: Colors.white,
                      child: new InkWell(
                        onTap: () {},
                        child: new Padding(
                          padding: EdgeInsets.all(8.0),
                          child: new Row(children: <Widget>[
                            new Expanded(child: new Text("${_items[position]}"))
                          ]),
                        ),
                      ));
                })));
  }

  @override
  void initState() {
    print("INIT STATE");
    initData();
    super.initState();
  }

  Future initData() async {
    if (_items == null) _getDataFromNetwork();
  }

  void _getDataFromNetwork() async {
    http.Response response = await _networkManager.getCityList();
    setState(() {
      print("SET STATE");
      if (response != null)
        _items = CityList.fromJson(json.decode(response.body)).cityList;
    });
  }
}

class CityList {
  List cityList;

  CityList({this.cityList});

  factory CityList.fromJson(List<dynamic> cities) {
    return CityList(
      cityList: cities,
    );
  }
}