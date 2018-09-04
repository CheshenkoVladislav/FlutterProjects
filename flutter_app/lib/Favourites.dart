import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final String _appBarTitle = "ListViewApplication";
  final List<ListItemWidget> items =
      new List<ListItemWidget>.generate(10, (i) => new ListItemWidget());

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(title: new Text(_appBarTitle)),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return new Dismissible(
                key: new Key(items[index].toString()),
                onDismissed: (direction) {
                  items.removeAt(index);
                },
                child: new ListItemWidget(),
              );
            }),
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final double _paddingAll = 4.0;
  final String _imageAssetName = "assets/images/flutter.png";
  final double _imageHeight = 220.0;
  final double _imageWidth = 120.0;
  final double _imagePaddingLeft = 60.0;
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
                  padding: new EdgeInsets.all(_paddingAll),
                  child: new Column(children: <Widget>[
                    new Text("Shop"),
                    new Text("Address")
                  ])))
        ])));
  }
}
