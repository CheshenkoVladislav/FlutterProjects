import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/FavouritesList.dart';
import 'package:flutter_app/data/FavouriteData.dart';
import 'package:flutter_app/managers/NetworkManager.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavouriteItem extends StatelessWidget {
  final Favourite favouriteData;
  final FavouriteState parentState;
  final int index;

  //ITEM SIZE
  final double _paddingAll = 4.0;
  final double _contentPadding = 40.0;
  final double _imagePaddingLeft = 60.0;
  final double _imageHeight = 220.0;
  final double _imageWidth = 120.0;
  final double _textPaddingLeft = 32.0;
  final double _textPaddingBottom = 8.0;

  SlideToDismissDrawerDelegate slideToDismiss;

  FavouriteItem.fromNetwork(this.favouriteData, this.parentState, this.index);

  void _changeScreen(context) {
    Navigator.pushNamed(context, '/second');
  }

  @override
  Widget build(BuildContext context) {
    print("IMAGE: = " + favouriteData.thumbnail);
    double screenHeight = MediaQuery.of(context).size.height;
    double itemHeight = screenHeight / 2.6;
    return new GestureDetector(
        onTap: () {
          _changeScreen(context);
        },
        child: new Padding(
            padding: new EdgeInsets.all(_paddingAll),
            child: new Card(
                child: new Dismissible(
                    direction: DismissDirection.endToStart,
                    key: new Key(Random.secure().nextInt(1234).toString()),
                    background: new LeaveBehindView(),
                    onDismissed: (direction) {
                      parentState.removeItem(index);
                    },
                    child: new Container(
                        height: itemHeight,
                        child: Padding(
                          padding: new EdgeInsets.only(
                              right: _contentPadding,
                              top: _contentPadding,
                              bottom: _contentPadding,
                              left: _imagePaddingLeft),
                          child: new Row(children: <Widget>[
                            _buildImage(),
                            _buildTextColumn()
                          ]),
                        ))))));
  }

  Image _buildImage() {
    return new Image(
      image: NetworkImage(favouriteData.thumbnail),
      height: _imageHeight,
      width: _imageWidth,
      fit: BoxFit.cover,
    );
  }

  Expanded _buildTextColumn() {
    return new Expanded(
        child: new Padding(
            padding: new EdgeInsets.all(_textPaddingLeft),
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: new EdgeInsets.only(bottom: _textPaddingBottom),
                    child: new Text(favouriteData.name),
                  ),
                  Padding(
                    padding: new EdgeInsets.only(bottom: _textPaddingBottom),
                    child: new Text('МАГАЗИН'),
                  ),
                  new Text(favouriteData.price.toString())
                ])));
  }
}

class LeaveBehindView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.red,
      padding: const EdgeInsets.all(16.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Text(''),
          ),
          new Icon(
            Icons.delete,
            key: new Key('Icon_key'),
            color: Colors.white,
            size: 36.0,
          )
        ],
      ),
    );
  }
}
