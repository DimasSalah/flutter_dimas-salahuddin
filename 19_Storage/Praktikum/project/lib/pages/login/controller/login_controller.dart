import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends ChangeNotifier {
  String _username = '';
  String _password = '';
  bool _isLogin = false;

  String get username => _username;
  String get password => _password;
  bool get isLogin => _isLogin;

  void setUsername(String value) {
    _username = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
  }

  void login(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    if (_password == 'admin') {
      _isLogin = true;
      prefs.setBool('isLogin', _isLogin);
      prefs.setString('username', _username);
      Navigator.pushNamedAndRemoveUntil(context, '/contact', (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password is incorrect'),
        ),
      );
    }
  }

}
