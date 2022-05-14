import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ##########################################
// Local storage to save pin password for user
class LocalStorage {
  final _storage = FlutterSecureStorage();
  // ######################
  // for write data
  Future writeSecureData(String key, String value) async {
    var writeData = await _storage.write(key: key, value: value);
    return writeData;
  }

// ####################
// for read saved data
  Future readSecureData(String key) async {
    var readData = await _storage.read(
      key: key,
    );
    return readData;
  }

// #####################
// for delete saved data
  Future deleteSecureData(String key) async {
    var deleteData = await _storage.delete(key: key);
  }
}
