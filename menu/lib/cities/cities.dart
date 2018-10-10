import 'package:flutter/material.dart';
import 'package:menu/constants.dart';
import 'package:menu/main.dart';
import 'package:menu/managers/networkManager.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
  final Future sharedPreferences = SharedPreferences.getInstance();

  _CitiesState(this._networkManager);

  @override
  Widget build(BuildContext context) {
    if (_items != null) print("count: $_items");
    return new Scaffold(
            appBar: new AppBar(title: new Text("CITIES")),
            body: ListView.builder(
                itemCount: _items == null ? 0 : _items.length,
                itemBuilder: (context, position) {
                  return new Material(
                      color: Colors.white,
                      child: new InkWell(
                        onTap: () {
                          setCity(_items[position]);
                          _back(context);
                        },
                        child: new Padding(
                          padding: EdgeInsets.all(8.0),
                          child: new Row(children: <Widget>[
                            new Expanded(child: new Text("${_items[position]}"))
                          ]),
                        ),
                      ));
                }));
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

  Future setCity(String city) async {
    final SharedPreferences preferences = await sharedPreferences;
    preferences.setString(Constants.CITY_KEY, city);
    print("SET CITY: ${preferences.getString(Constants.CITY_KEY)}");
  }

  void _getDataFromNetwork() async {
    http.Response response = await _networkManager.getCityList();
    setState(() {
      print("SET STATE");
      if (response != null)
        _items = CityList.fromJson(json.decode(response.body)).cityList;
    });
  }

  void _back(context) {
    Navigator.pop(context);
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
