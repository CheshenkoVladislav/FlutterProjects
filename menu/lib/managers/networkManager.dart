import 'dart:async';
import 'package:http/http.dart' as http;

class NetworkManager {
  static const String _FAILED_HTTP_RESPONSE = 'FAILED HTTP RESPONSE';
  static const String _URL = 'http://api.dressmeapp.ru/v2/feedback';

  Future sendFeedback(String mail, String message) async {
    String request = "$_URL?mail=$mail&msg=$message";
    print('START SEND FEEDBACK: mail: $mail; message: $message');
    print('REQUEST: = $request');
    final response = await http
        .post(Uri.encodeFull(request));
    if (response.statusCode == 200) {
      print("SUCCESS SEND FEEDBACK ITEM!!!");
      return response;
    } else {
      throw Exception(_FAILED_HTTP_RESPONSE);
    }
  }
}
