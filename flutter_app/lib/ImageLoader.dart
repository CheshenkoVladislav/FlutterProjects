import 'package:flutter/widgets.dart';

class ImageLoader extends StatelessWidget {

  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  ImageLoader(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl);
  }}