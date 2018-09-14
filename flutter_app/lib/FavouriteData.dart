import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class FavouritesWrapper {
  List<FavouriteJSON> favs;

  FavouritesWrapper(this.favs);

  factory FavouriteJSON.fromJson(Map<String, dynamic> json) {
    return FavouriteJSON(
      id: json['id'],
      appUUID: json['appUUID'],
      name: json['name'],
      price: json['price'],
      shopId: json['shopId'],
      thumbnail: json['thumbnail'],
    );
  }
}

class FavouriteJSON {
  final FavId id;
  final String appUUID;
  final String name;
  final double price;
  final ShopId shopId;
  final String thumbnail;

  FavouriteJSON(
      {this.id, this.appUUID, this.name, this.price, this.shopId, this.thumbnail});

  factory FavouriteJSON.fromJson(Map<String, dynamic> json) {
    return FavouriteJSON(
      id: json['id'],
      appUUID: json['appUUID'],
      name: json['name'],
      price: json['price'],
      shopId: json['shopId'],
      thumbnail: json['thumbnail'],
    );
  }
}

class FavId {
  final String id;

  FavId({this.id});

  factory FavId.fromJson(Map<String, dynamic> json) {
    return FavId(
      id: json['id'],
    );
  }
}

class ShopId {
  final String id;

  ShopId({this.id});

  factory FavId.fromJson(Map<String, dynamic> json) {
    return FavId(
      id: json['id'],
    );
  }
}