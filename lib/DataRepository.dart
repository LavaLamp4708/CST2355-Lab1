import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

class DataRepository {
  static String fName = "";
  static String lName = "";
  static String phone = "";
  static String email = "";
  static late String username;

  static Future<void> loadData() async {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
    String? fName = await prefs.getString('fName');
    String? lName = await prefs.getString('lName');
    String? phone = await prefs.getString('phone');
    String? email = await prefs.getString('email');

    DataRepository.fName = fName;
    DataRepository.lName = lName;
    DataRepository.phone = phone;
    DataRepository.email = email;
  }

  static Future<void> saveData() async {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
    await prefs.setString('fName', DataRepository.fName);
    await prefs.setString('lName', DataRepository.lName);
    await prefs.setString('phone', DataRepository.phone);
    await prefs.setString('email', DataRepository.email);
  }
}