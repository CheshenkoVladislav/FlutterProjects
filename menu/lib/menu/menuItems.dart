import 'package:flutter/material.dart';
import 'package:menu/main.dart';

class MenuGroupItemText extends StatelessWidget {
  final double _topPadding = 8.0;
  final _items;

  MenuGroupItemText(this._items);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: new Material(
            elevation: 6.0,
            color: Colors.white,
            child: new Column(
              children: <Widget>[
                new MenuItemText(_items[0]),
                new MenuItemText(_items[1], Menu.FEEDBACK_SCREEN),
                new MenuItemText(_items[2], Menu.POLITIC_SCREEN)
              ],
            )));
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

class MenuItemText extends StatelessWidget {
  final double _mainPadding = 8.0;
  final String text;
  double _leftPadding;
  double _rightPadding;
  double _topPadding;
  double _botPadding;
  String _routeTag;

  MenuItemText(this.text, [this._routeTag]);

  MenuItemText.customPaddings(this.text, this._topPadding, this._botPadding,
      this._rightPadding, this._leftPadding,
      [this._routeTag]);

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
                  _changeScreen(context, _routeTag);
                  break;
                case "Политика конфиденциальности":
                  _changeScreen(context, _routeTag);
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

  void _changeScreen(context, String routeTag) {
    if (routeTag != null) Navigator.pushNamed(context, routeTag);
  }
}
