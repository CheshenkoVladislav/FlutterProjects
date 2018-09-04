import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  final String _appBarTitle = "ListViewApplication";

  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final String _appBarTitle = "ListViewFirstApplication";
  final _stringItems = List<String>.generate(10, (i) => '$i');
  var _items = initItemList();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(title: new Text(_appBarTitle)),
        body: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              final item = _items[index];
              return Dismissible(
                key: new Key(item.toString() + index.toString()),
                onDismissed: (direction) {
                  setState(() {
                    _items.removeAt(index);
                  });
                },
                child: new ListItemWidget()
              );
            }),
      ),
    );
  }

  static List initItemList() {
    List items = new List();
    for (int i = 0; i < 10; i++) {
      items.add(new ListItemWidget());
    }
    return items;
  }
}

class ListItemWidget extends StatelessWidget {
  final double _paddingAll = 4.0;
  final String _imageAssetName = "assets/images/flutter.png";
  final double _imageHeight = 220.0;
  final double _imageWidth = 120.0;
  final double _imagePaddingLeft = 60.0;
  final double _textPaddingLeft = 32.0;
  final double _textPaddingBottom = 8.0;
  final double _paddingLeft = 8.0;
  final double _paddingRight = 8.0;

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: new EdgeInsets.all(_paddingAll),
        child: new Card(
            child: new Row(children: <Widget>[
          Padding(
            padding: new EdgeInsets.only(left: _imagePaddingLeft),
            child: new Image(
                image: AssetImage(_imageAssetName),
                width: _imageWidth,
                height: _imageHeight),
          ),
          new Expanded(
              child: new Padding(
                  padding: new EdgeInsets.all(_textPaddingLeft),
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                              new EdgeInsets.only(bottom: _textPaddingBottom),
                          child: new Text("Shop"),
                        ),
                        Padding(
                          padding:
                              new EdgeInsets.only(bottom: _textPaddingBottom),
                          child: new Text("Address"),
                        ),
                        new Text("Price")
                      ])))
        ])));
  }
}
