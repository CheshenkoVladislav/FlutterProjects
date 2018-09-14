import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/managers/DeviceManager.dart';
import 'package:flutter_app/data/FavouriteData.dart';
import 'package:flutter_app/FavoutiteItem.dart';
import 'package:flutter_app/managers/NetworkManager.dart';
import 'package:http/http.dart' as http;

class FavouritList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FavouritState();
  }
}

class FavouritState extends State<FavouritList> {
  List<Favourite> _items;
  String _device;
  DeviceManager deviceManager = new DeviceManager();
  NetworkManager networkManager = new NetworkManager();

  Future initDeviceInfo() async {
    Map deviceMap = await deviceManager.initPlatformState();
    _device = deviceMap['device'];
  }

  Future initData() async {
    http.Response response = await networkManager.getFavourites(_device);
    setState(() {
      print("SET STATE");
      _items = FavouritesWrapper.fromJson(json.decode(response.body)).favorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _items == null ? 0 : _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Dismissible(
              key: new Key(item.name + item.shopId.id),
              onDismissed: (direction) {
                setState(() {
                  //TODO: Remove POST there
                  networkManager.removeItem(_device, _items[index].toString());
                  _items.removeAt(index);
                });
              },
              child: new FavouriteItem.fromNetwork(_items[index]));
        });
  }

  @override
  void initState() {
    super.initState();
    initDeviceInfo();
    initData();
  }
}
