import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceServices {
  final keyEmail = "email";

  Future<String?> getEmail() async {
    final pref = await SharedPreferences.getInstance();
    print("MSG = Success get email");
    return pref.getString(keyEmail);
  }

  Future<bool> saveEmail(String email) async {
    final pref = await SharedPreferences.getInstance();
    print("MSG = Success ssave email");
    return pref.setString(keyEmail, email);
  }

  Future<bool> deleteEmail() async {
    final pref = await SharedPreferences.getInstance();
    print("MSG = Success delete email");
    return pref.remove(keyEmail);
  }
}
