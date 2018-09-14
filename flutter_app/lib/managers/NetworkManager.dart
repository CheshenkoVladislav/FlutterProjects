import 'dart:async';
import 'package:http/http.dart' as http;

class NetworkManager {
  static const String _FAILED_HTTP_RESPONSE = 'FAILED HTTP RESPONSE';
  static const String _URL = 'http://api.dressmeapp.ru/v2/favorites/';

  Future getFavourites(String device) async {
    final response = await http.get(
      Uri.encodeFull(_URL + '/list?'),
    );
    if (response.statusCode == 200) {
      print("GET DATA SUCCESS!!!");
      return response;
    } else {
      throw Exception(_FAILED_HTTP_RESPONSE);
    }
  }

  Future removeItem(String device, String itemId) async {
    final response = await http
        .post(Uri.encodeFull(_URL + '/remove?' + device + '&' + itemId));
    if (response.statusCode == 200) {
      print("SUCCESS REMOVE ITEM!!!");
      return response;
    } else {
      throw Exception(_FAILED_HTTP_RESPONSE);
    }
  }
}
