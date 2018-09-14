import 'dart:async';
import 'package:http/http.dart' as http;

class NetworkManager {

  Future getFavourites(String device) async {
    final response = await http.get(
        Uri.encodeFull('http://api.dressmeapp.ru/v2/favorites/list?' + device),
        headers: {});
    if (response.statusCode == 200) {
      print("SUCCESS!!!");
      return response;
    } else {
      throw Exception('FAILED HTTP RESPONSE');
    }
  }

  Future removeItem(String device, String itemId) async {
    final response = await http.post(Uri.encodeFull(
        'http://api.dressmeapp.ru/v2/favorites/remove?' +
            device +
            '&' +
            itemId));
    return response;
  }
}
