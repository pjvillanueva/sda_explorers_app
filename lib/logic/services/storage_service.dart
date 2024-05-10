import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  _getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  void saveData(String key, dynamic value) async {
    SharedPreferences prefs = await _getSharedPreferences();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      print("Storage: Invalid Type");
    }
  }

  //get dynamic data
  Future<dynamic> readData(String key) async {
    SharedPreferences prefs = await _getSharedPreferences();
    return prefs.get(key);
  }

  //get string data
  Future<String?> getString(String key) async {
    SharedPreferences prefs = await _getSharedPreferences();
    return prefs.getString(key);
  }

//get int data
  Future<int?> getInt(String key) async {
    SharedPreferences prefs = await _getSharedPreferences();
    return prefs.getInt(key);
  }

//get bool data
  Future<bool?> getBool(String key) async {
    SharedPreferences prefs = await _getSharedPreferences();
    return prefs.getBool(key);
  }

//delete data
  Future<bool> deleteData(String key) async {
    SharedPreferences prefs = await _getSharedPreferences();
    return prefs.remove(key);
  }

//check if storage contains key
  Future<bool> containsKey(String key) async {
    SharedPreferences prefs = await _getSharedPreferences();
    return prefs.containsKey(key);
  }
}
