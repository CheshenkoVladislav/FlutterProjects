import 'package:flutter/material.dart';

class FeedbackButton extends StatelessWidget {
  final double _itemsPadding;
  final double _sidePadding = 56.0;
  final double _borderRadius;
  final String _buttonText;
  final clickHandler;

  FeedbackButton(this._itemsPadding, this._borderRadius, this._buttonText, this.clickHandler);

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding:
        new EdgeInsets.only(top: _itemsPadding, left: _sidePadding, right: _sidePadding),
        child: new OutlineButton(
          highlightElevation: 4.0,
          disabledBorderColor: Colors.blue,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(_borderRadius)),
          child: new Text(_buttonText),
          onPressed: clickHandler,
        ));
  }
}