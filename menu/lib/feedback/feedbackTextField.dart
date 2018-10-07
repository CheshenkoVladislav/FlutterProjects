import 'package:flutter/material.dart';

class FeedbackTextField extends StatefulWidget {
  final int _maxLines;
  final String _hint;
  final double _borderRadius;
  final TextEditingController textController;

  FeedbackTextField(this._maxLines, this._hint, this._borderRadius, this.textController);

  @override
  State<StatefulWidget> createState() {
    return new _FeedbackTextFieldState(_maxLines, _hint, _borderRadius, textController);
  }
}

class _FeedbackTextFieldState extends State<FeedbackTextField> {
  final int _maxLines;
  final String _hint;
  final double _borderRadius;
  final TextEditingController _textController;

  _FeedbackTextFieldState(this._maxLines, this._hint, this._borderRadius,  this._textController);

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      controller: _textController,
        maxLines: _maxLines,
        textInputAction: TextInputAction.none,
        decoration: new InputDecoration(
            hintText: _hint,
            border: new OutlineInputBorder(
                borderRadius:
                new BorderRadius.all(new Radius.circular(_borderRadius)))));
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
