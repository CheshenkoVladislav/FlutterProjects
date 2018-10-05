import 'package:flutter/material.dart';

void main() => runApp(new Feedback());

class Feedback extends StatelessWidget {
  final double _mainPadding = 36.0;
  final double _itemsPadding = 24.0;
  final String _buttonText = "Отправить";
  final String _emailHint = "Ваш e-mail";
  final String _messageHint = "Сообщение";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(title: new Text("FEEDBACK")),
            body: new Padding(
                padding: EdgeInsets.all(_mainPadding),
                child: new ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, position) {
                    switch (position) {
                      case 0:
                        return new FeedbackTextFields(1, _emailHint);
                      case 1:
                        return new Padding(
                            padding: new EdgeInsets.only(top: _itemsPadding),
                            child: new FeedbackTextFields(10, _messageHint));
                      case 2:
                        return FeedbackButton(_itemsPadding, _buttonText);
                    }
                  },
                ))));
  }
}

class FeedbackButton extends StatelessWidget {
  final double _itemsPadding;
  final String _buttonText;

  FeedbackButton(this._itemsPadding, this._buttonText);

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: new EdgeInsets.only(top: _itemsPadding),
        child: new OutlineButton(
            disabledBorderColor: Colors.blue,
            shape: new RoundedRectangleBorder(
                borderRadius:
                new BorderRadius.circular(8.0)),
            child: new Text(_buttonText),
            onPressed: null));
  }

}

class FeedbackTextFields extends StatelessWidget {
  final int _maxLines;
  final String _hint;

  FeedbackTextFields(this._maxLines, this._hint);

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
        maxLines: _maxLines,
        textInputAction: TextInputAction.none,
        decoration: new InputDecoration(
            hintText: _hint,
            border: new OutlineInputBorder(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)))));
  }
}
