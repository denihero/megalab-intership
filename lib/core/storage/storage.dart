import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const storage = FlutterSecureStorage();

  static Future<void> writeData(String value,String key) async {
    await storage.write(key: key, value: value);
  }

  static Future<String?> readData(String key) async {
    return await storage.read(key: key);
  }
}