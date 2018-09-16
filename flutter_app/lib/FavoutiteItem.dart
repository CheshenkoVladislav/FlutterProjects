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
  final NetworkManager networkManager;

  final String device;

  //ITEM SIZE
  final double _paddingAll = 4.0;
  final double _contentPadding = 40.0;
  final double _imagePaddingLeft = 60.0;
  final double _imageHeight = 220.0;
  final double _imageWidth = 120.0;
  final double _textPaddingLeft = 32.0;
  final double _textPaddingBottom = 8.0;

  SlideToDismissDrawerDelegate slideToDismiss;

  FavouriteItem.fromNetwork(this.favouriteData, this.parentState, this.index,
      this.device, this.networkManager);

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
                child: new Slidable(
                    key: new Key(favouriteData.id.id),
                    actionExtentRatio: 0.25,
                    delegate: new SlidableStrechDelegate(),
                    actions: <Widget>[
                      new IconSlideAction(
                          caption: 'Delete',
                          closeOnTap: false,
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {
                            parentState.removeItem(index);
                          })
                    ],
                    slideToDismissDelegate: new SlideToDismissDrawerDelegate(
                        onDismissed: (actionType) {
                      parentState.setState(() {
                        networkManager.removeItem(device, favouriteData.id.id);
                        parentState.items.removeAt(index);
                      });
                    }),
                    child: new Container(
                        height: itemHeight,
                        child: Padding(
                          padding: new EdgeInsets.only(
                              right: _contentPadding,
                              top: _contentPadding,
                              bottom: _contentPadding,
                              left: _imagePaddingLeft),
                          child: new Row(children: <Widget>[
                            new Image(
                              image: NetworkImage(favouriteData.thumbnail),
                              height: _imageHeight,
                              width: _imageWidth,
                              fit: BoxFit.cover,
                            ),
                            new Expanded(
                                child: new Padding(
                                    padding:
                                        new EdgeInsets.all(_textPaddingLeft),
                                    child: new Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                          new Text(
                                              favouriteData.price.toString())
                                        ])))
                          ]),
                        ))))));
  }

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: new Text(text)));
  }
}
