import 'package:flutter/material.dart';
import 'package:menu/cities/cities.dart';
import 'package:menu/feedback/feedback.dart';
import 'package:menu/menu/menuItems.dart';
import 'package:menu/politic/politic.dart';

void main() => runApp(new Menu());

class Menu extends StatelessWidget {
  static const String INIT_ROUTE = '/';
  static const String POLITIC_SCREEN = '/politic';
  static const String FEEDBACK_SCREEN = '/feedback';
  static const String CITIES_SCREEN = '/cities';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: INIT_ROUTE,
      routes: {
        POLITIC_SCREEN : (context) => new Politic(),
        FEEDBACK_SCREEN : (context) => new FeedbackScreen(),
        CITIES_SCREEN : (context) => new Cities()
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

class MenuList extends StatelessWidget {
  final String _city = "Moscow";
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
        new MenuItemText.customPaddings(_city, 16.0, 8.0, 0.0, 8.0, Menu.CITIES_SCREEN),
        new MenuItemImages(itemImageHeight),
        new MenuGroupItemText(_items)
      ],
    );
  }
}