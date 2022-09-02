import 'dart:convert';
import 'dart:io';

import 'package:hrms_app/service/http_service.dart';
import 'package:hrms_app/utils/toast_msg.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<dynamic> getLogin(String userName, password) async {
    try {
      String url =
          "https://precede.abshrms.com/api/auth/login?password=$password&user_code=$userName";
      http.Response? response = await HttpService.postApi(url: url);

      return json.decode(response!.body);
    } on SocketException {
      rethrow;
    } on Exception catch (e) {
      showToast(e.toString());
      return null;
    }
  }
}
