import 'package:flutter/material.dart';
import 'package:flutter_app/data/FavouriteData.dart';

class FavouriteItem extends StatelessWidget {

  final Favourite favouriteData;

  //ITEM SIZE
  final double _paddingAll = 4.0;
  final double _contentPadding = 40.0;
  final double _imagePaddingLeft = 60.0;
  final double _imageHeight = 220.0;
  final double _imageWidth = 120.0;
  final double _textPaddingLeft = 32.0;
  final double _textPaddingBottom = 8.0;

  FavouriteItem.fromNetwork(this.favouriteData);

  void _changeScreen(context) {
    Navigator.pushNamed(context, '/second');
  }

  @override
  Widget build(BuildContext context) {
    print("IMAGE: = " + favouriteData.thumbnail);
    double _screenSize = MediaQuery
        .of(context)
        .size
        .height;
    return new GestureDetector(
      onTap: (){
        _changeScreen(context);
      },
      child: new Padding(
        padding: new EdgeInsets.all(_paddingAll),
        child: new Card(
            child: new Container(
                height: _screenSize / 2.6,
                child: Padding(
                  padding: new EdgeInsets.only(right: _contentPadding,
                      top: _contentPadding,
                      bottom: _contentPadding,
                      left: _imagePaddingLeft),
                  child: new Row(children: <Widget>[
                    new Image(image: NetworkImage(favouriteData.thumbnail),
                      height: _imageHeight,
                      width: _imageWidth,
                      fit: BoxFit.cover,
                    ),
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
                                  child: new Text(favouriteData.name),
                                ),
                                Padding(
                                  padding: new EdgeInsets.only(
                                      bottom: _textPaddingBottom),
                                  child: new Text('МАГАЗИН'),
                                ),
                                new Text(favouriteData.price.toString())
                              ])))
                  ]),
                )))));
  }
}
