import 'dart:async';
import 'package:http/http.dart' as http;

class NetworkManager {
  static const String _FAILED_HTTP_RESPONSE = 'FAILED HTTP RESPONSE';
  static const String _URL = 'http://api.dressmeapp.ru/v2/favorites';

  Future getFavourites(String device) async {
    String request = _URL + '/list?';
    print('START GET DATA: $device');
    print('REQUEST: = $request');
    final response = await http.get(
      Uri.encodeFull(request),
    );
    if (response.statusCode == 200) {
      print("GET DATA SUCCESS!!!");
      print(response.body);
      return response;
    } else {
      throw Exception(_FAILED_HTTP_RESPONSE);
    }
  }

  Future removeItem(String device, String itemId) async {
    String request = _URL + '/remove?device3x=' + device + '&item=' + itemId;
    print('START REMOVE: device: $device; itemId: $itemId');
    print('REQUEST: = $request');
    final response = await http
        .post(Uri.encodeFull(request));
    if (response.statusCode == 200) {
      print("SUCCESS REMOVE ITEM!!!");
      return response;
    } else {
      throw Exception(_FAILED_HTTP_RESPONSE);
    }
  }
}
