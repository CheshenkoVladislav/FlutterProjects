import 'package:flutter/material.dart';

void main() => runApp(new Menu());

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.blueGrey,
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
        new MenuItemText(_city),
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
    return new Container(
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
            ])); // TODO: implement build
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
    return Expanded(
        child: new Container(
            padding: EdgeInsets.only(top: _topPadding),
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
  final double _leftPadding = 8.0;
  final double _topPadding = 16.0;
  final double _botPadding = 8.0;
  final double _mainPadding = 8.0;
  final String text;

  MenuItemText(this.text);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
        onTap: () {
//          Scaffold.of(context).showSnackBar(SnackBar(
//            content: Text('Tap'),
//          ));
        },
        child: new Container(
      color: Colors.white,
      padding: EdgeInsets.all(_mainPadding),
      child: new Row(children: <Widget>[
        new Expanded(child: new Text(text)),
        new Icon(Icons.chevron_right)
      ]),
    ));
  }
}
