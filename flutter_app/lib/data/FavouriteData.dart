class FavouritesWrapper {
  List<Favourite> favorites;

  FavouritesWrapper({this.favorites});

  factory FavouritesWrapper.fromJson(List<dynamic> favourites) {
    List<Favourite> favList =
        favourites.map((i) => Favourite.fromJson(i)).toList();
    return FavouritesWrapper(
      favorites: favList,
    );
  }
}

class Favourite {
  final FavId id;
  final String appUUID;
  final String name;
  final String price;
  final ShopId shopId;
  final String thumbnail;

  Favourite(
      {this.id,
      this.appUUID,
      this.name,
      this.price,
      this.shopId,
      this.thumbnail});

  factory Favourite.fromJson(Map<String, dynamic> json) {
    return Favourite(
      id: FavId.fromJson(json['_id']),
      appUUID: json['appUUID'],
      name: json['name'],
      price: json['price'].toString(),
      shopId: ShopId.fromJson(json['shopId']),
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

  factory ShopId.fromJson(Map<String, dynamic> json) {
    return ShopId(
      id: json['\$oid'],
    );
  }
}
