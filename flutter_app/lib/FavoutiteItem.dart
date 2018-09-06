import 'package:flutter/material.dart';

class FavouriteItem extends StatelessWidget {

  final int id;
  final double _paddingAll = 4.0;
  final double _contentPadding = 40.0;
  final double _imagePaddingLeft = 60.0;
  final String _imageAssetName = "assets/images/image.jpg";
  final double _imageHeight = 220.0;
  final double _imageWidth = 120.0;
  final double _textPaddingLeft = 32.0;
  final double _textPaddingBottom = 8.0;

  FavouriteItem(this.id);

  @override
  Widget build(BuildContext context) {
    double _screenSize = MediaQuery
        .of(context)
        .size
        .height;
    return new Padding(
        padding: new EdgeInsets.all(_paddingAll),
        child: new Card(
            child: new Container(
                height: _screenSize / 2.6,
                child: Padding(
                  padding: new EdgeInsets.only(right: _contentPadding,
                      top: _contentPadding,
                      bottom: _contentPadding,
                      left: _imagePaddingLeft),
                  child: new Row(children: <Widget>[new Image(
                      image: AssetImage(_imageAssetName),
                      width: _imageWidth,
                      height: _imageHeight,
                      fit: BoxFit.cover),
                  new Expanded(
                      child: new Padding(
                          padding: new EdgeInsets.all(_textPaddingLeft),
                          child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: new EdgeInsets.only(
                                      bottom: _textPaddingBottom),
                                  child: new Text("Shop"),
                                ),
                                Padding(
                                  padding: new EdgeInsets.only(
                                      bottom: _textPaddingBottom),
                                  child: new Text("Address"),
                                ),
                                new Text("Price")
                              ])))
                  ]),
                ))));
  }
}