import 'package:flutter/material.dart';
import 'package:menu/feedback/feedbackButton.dart';
import 'package:menu/feedback/feedbackTextField.dart';
import 'package:menu/managers/networkManager.dart';

class FeedbackScreen extends StatelessWidget {
  final double _mainPadding = 36.0;
  final double _itemsPadding = 24.0;
  final _fieldsBorderRadius = 8.0;
  final String _buttonText = "Отправить";
  final String _emailHint = "Ваш e-mail";
  final String _messageHint = "Сообщение";
  final String _appBarTitle = "FEEDBACK";
  final _emailController = new TextEditingController();
  final _messageController = new TextEditingController();
  final NetworkManager _networkManager = new NetworkManager();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(title: new Text(_appBarTitle)),
            body: new Padding(
                padding: EdgeInsets.all(_mainPadding),
                child: new ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, position) {
                    switch (position) {
                      case 0:
                        return new FeedbackTextField(1, _emailHint,
                            _fieldsBorderRadius, _emailController);
                      case 1:
                        return new Padding(
                            padding: new EdgeInsets.only(top: _itemsPadding),
                            child: new FeedbackTextField(10, _messageHint,
                                _fieldsBorderRadius, _messageController));
                      case 2:
                        return new FeedbackButton(
                            _itemsPadding, _fieldsBorderRadius, _buttonText,
                            () {
                          print("email:= ${_emailController.text};\nmessage:= ${_messageController.text}");
                          _networkManager.sendFeedback(_emailController.text, _messageController.text);
                        });
                    }
                  },
                ))));
  }
}
