import 'dart:async';

import 'package:flutter/material.dart';
import 'package:menu/cities/cities.dart';
import 'package:menu/constants.dart';
import 'package:menu/feedback/feedback.dart';
import 'package:menu/menu/menuItems.dart';
import 'package:menu/politic/politic.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(new Menu());

class Menu extends StatelessWidget {
  static const String INIT_ROUTE = '/';
  static const String POLITIC_SCREEN = '/politic';
  static const String FEEDBACK_SCREEN = '/feedback';
  static const String CITIES_SCREEN = '/cities';

  @override
  Widget build(BuildContext context) {
    print("MAIN BUILD");
    return new MaterialApp(
      initialRoute: INIT_ROUTE,
      routes: {
        POLITIC_SCREEN: (context) => new Politic(),
        FEEDBACK_SCREEN: (context) => new FeedbackScreen(),
        CITIES_SCREEN: (context) => new Cities()
      },
      home: new Scaffold(
        backgroundColor: Colors.white70,
        appBar: new AppBar(
          title: new Text("Menu"),
          centerTitle: true,
        ),
        body: new MenuList(),
      ),
    );
  }
}

class MenuList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MenuListState();
  }
}

class MenuListState extends State<MenuList> {
  Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
  String _city;
  final _items = [
    "Оценить приложение",
    "Обратная связь",
    "Политика конфиденциальности"
  ];

  @override
  Widget build(BuildContext context) {
    double itemImageHeight = MediaQuery.of(context).size.height / 4;
    return new Column(
      children: <Widget>[
        new MenuItemText.customPaddings(_city != null ? _city : "Город", 16.0,
            8.0, 0.0, 8.0, Menu.CITIES_SCREEN),
        new MenuItemImages(itemImageHeight),
        new MenuGroupItemText(_items)
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    print("MAIN INIT");
    initCity();
  }


  @override
  bool get mounted {
    print("MOUNTED");
  }


  @override
  void dispose() {
    print("dispose");
  }

  @override
  void reassemble() {
    print("reassemble");
  }


  @override
  void didChangeDependencies() {
    setState(() {
      initCity();
    });
  }

  Future initCity() async {
    _city = await sharedPreferences.then((SharedPreferences prefs) {
      return (prefs.getString(Constants.CITY_KEY) != null
          ? prefs.getString(Constants.CITY_KEY)
          : "Город");
    });
    setState(() {});
  }
}
