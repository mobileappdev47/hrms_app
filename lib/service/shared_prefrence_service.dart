import 'package:shared_preferences/shared_preferences.dart';

class StoragePrefService {
  setPrefString({String? key, value}) async {
    SharedPreferences? preferences = await SharedPreferences.getInstance();
    preferences.setString(key!, value);
  }

  Future<String> getPrefStringValue(String? key) async {
    SharedPreferences? preferences = await SharedPreferences.getInstance();
    String value = "";
    value = preferences.getString(key!).toString();
    return value;
  }
}
