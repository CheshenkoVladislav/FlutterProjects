import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/managers/DeviceManager.dart';
import 'package:flutter_app/data/FavouriteData.dart';
import 'package:flutter_app/FavoutiteItem.dart';
import 'package:flutter_app/managers/NetworkManager.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;

class FavouritList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FavouriteState();
  }
}

class FavouriteState extends State<FavouritList> {
  List<Favourite> items;
  String _device;
  DeviceManager deviceManager = new DeviceManager();
  NetworkManager networkManager = new NetworkManager();
  double animatedHeight;

  Future initDeviceInfo() async {
    Map deviceMap = await deviceManager.initPlatformState();
    _device = deviceMap['device'];
  }

  Future initData() async {
    if (items == null) {
      http.Response response = await networkManager.getFavourites(_device);
      setState(() {
        print("SET STATE");
        items =
            FavouritesWrapper.fromJson(json.decode(response.body)).favorites;
      });
    } else {
    setState(() {
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: new ScrollController(),
        itemCount: items == null ? 0 : items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return new FavouriteItem.fromNetwork(
              item, this, index, _device, networkManager);
        });
  }

  @override
  void initState() {
    super.initState();
    print('INIT STATE');
    initDeviceInfo();
    initData();
  }

  void removeItem(int index) {
    setState(() {
      if (items[index] != null) {
        items.removeAt(index);
      }
    });
  }
}
