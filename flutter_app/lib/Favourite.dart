import 'dart:convert';

class Favourite {
  final Object id;
  final String appUUID;
  final String name;
  final String price;
  final Object shopId;
  final String type;
  final String thumbnail;

  Favourite({this.id, this.appUUID, this.name, this.price, this.shopId, this.type, this.thumbnail});

  factory Favourite.fromJson(Map<String, dynamic> json) {
    return Favourite(
      id: json['id'],
      appUUID: json['appUUID'],
      name: json['name'],
      price: json['price'],
      shopId: json['shopId'],
      type: json['type'],
      thumbnail: json['thumbnail']
    );
  }
}