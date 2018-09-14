import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/DeviceManager.dart';
import 'package:flutter_app/FavoutiteItem.dart';
import 'package:flutter_app/NetworkManager.dart';
import 'package:http/http.dart' as http;

class FavouritList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FavouritState();
  }
}

class FavouritState extends State<FavouritList> {

  List _items = new List();
  List<FavouriteItem> items;
  String _device;
  DeviceManager deviceManager = new DeviceManager();
  NetworkManager networkManager = new NetworkManager();

  Future initDeviceInfo() async {
    Map deviceMap = await deviceManager.initPlatformState();
    _device = deviceMap['device'];
  }

  Future initData() async {
    String response = await networkManager.getFavourites(_device);
    setState(() {
      print("SET STATE");
      items = json.decode(response);
    });
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
                  //TODO: Remove POST there
                  networkManager.removeItem(_device, _items[index]['id']);
                  _items.removeAt(index);
                });
              },
              child: new FavouriteItem.fromNetwork(new FavouriteItem(favouriteData)));
        });
  }

  @override
  void initState() {
    initDeviceInfo();
    initData();
  }
}
