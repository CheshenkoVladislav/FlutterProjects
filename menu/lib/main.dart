import 'package:flutter/material.dart';
import 'package:menu/politic.dart';

//void main() => runApp(new Menu());

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/',
      routes: {'/politic': (context) => new PoliticScreen()},
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

  @override
  Widget build(BuildContext context) {
    double itemImageHeight = MediaQuery.of(context).size.height / 4;
    return new Column(
      children: <Widget>[
        new MenuItemText.customPaddings(_city, 16.0, 8.0, 0.0, 8.0),
        new MenuItemImages(itemImageHeight),
        new MenuGroupItemText()
      ],
    );
  }
}

class MenuItemImages extends StatelessWidget {
  final double _topPadding = 16.0;
  final double _bottomPadding = 16.0;
  final double _leftPadding = 56.0;
  final double _rightPadding = 8.0;

  final double _marginTop = 8.0;
  final double _marginBottom = 8.0;

  final double _imageHeight = 80.0;
  final double _imageWidth = 80.0;

  final _height;

  MenuItemImages(this._height);

  @override
  Widget build(BuildContext context) {
    return new Material(
        elevation: 6.0,
        child: new Container(
            color: Colors.white,
            height: _height,
            margin: EdgeInsets.only(top: _marginTop, bottom: _marginBottom),
            child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.only(
                        right: _rightPadding,
                        top: _topPadding,
                        bottom: _bottomPadding),
                    child: new Image(
                        fit: BoxFit.cover,
                        width: _imageWidth,
                        height: _imageHeight,
                        image: new AssetImage('assets/women.jpg')),
                  ),
                  new Container(
                    padding: EdgeInsets.only(
                        left: _leftPadding,
                        right: _rightPadding,
                        top: _topPadding,
                        bottom: _bottomPadding),
                    child: new Image(
                        fit: BoxFit.cover,
                        width: _imageWidth,
                        height: _imageHeight,
                        image: new AssetImage('assets/men.jpg')),
                  ),
                ]))); // TODO: implement build
  }
}

class MenuGroupItemText extends StatelessWidget {
  final double _topPadding = 8.0;
  final items = [
    "Оценить приложение",
    "Обратная связь",
    "Политика конфиденциальности"
  ];

  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: new Material(
            elevation: 6.0,
            color: Colors.white,
            child: new Column(
              children: <Widget>[
                new MenuItemText(items[0]),
                new MenuItemText(items[1]),
                new MenuItemText(items[2])
              ],
            )));
  }
}

class MenuItemText extends StatelessWidget {
  final double _mainPadding = 8.0;
  final String text;
  double _leftPadding;
  double _rightPadding;
  double _topPadding;
  double _botPadding;

  MenuItemText(this.text);

  MenuItemText.customPaddings(this.text, this._topPadding, this._botPadding,
      this._rightPadding, this._leftPadding);

  @override
  Widget build(BuildContext context) {
    if (_topPadding != null ||
        _botPadding != null ||
        _rightPadding != null ||
        _leftPadding != null)
      return createMenuItemWithPaddings(
          context, _topPadding, _botPadding, _rightPadding, _leftPadding);
    else
      return createMenuItem(context);
  }

  Widget createMenuItemWithPaddings(BuildContext context, double topPadding,
      botPadding, double rightPadding, double leftPadding) {
    return new Material(
        elevation: 6.0,
        color: Colors.white,
        child: new InkWell(
            onTap: () {},
            child: new Padding(
              padding: EdgeInsets.only(
                  top: _topPadding,
                  bottom: _botPadding,
                  right: _rightPadding,
                  left: _leftPadding),
              child: new Row(children: <Widget>[
                new Expanded(child: new Text(text)),
                new Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                )
              ]),
            )));
  }

  Widget createMenuItem(BuildContext context) {
    return new Material(
        color: Colors.white,
        child: new InkWell(
            onTap: () {
              switch (text) {
                case "Оценить приложение":
                  break;
                case "Обратная связь":
                  break;
                case "Политика конфиденциальности":
                  _changeScreen(context);
                  break;
              }
            },
            child: new Padding(
              padding: EdgeInsets.all(_mainPadding),
              child: new Row(children: <Widget>[
                new Expanded(child: new Text(text)),
                new Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                )
              ]),
            )));
  }

  void _changeScreen(context) {
    Navigator.pushNamed(context, '/politic');
  }
}
