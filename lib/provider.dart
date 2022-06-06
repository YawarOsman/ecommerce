import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassProvider extends ChangeNotifier {
  static bool _isDark = false;
  static bool _isLoggedIn = false;

  Future IsDark() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    _isDark = sharedPreferences.getBool('isDark')!;
    notifyListeners();
  }

  bool get getIsDark {
    return _isDark;
  }

  Future IsLoggedIn() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    _isLoggedIn = sharedPreferences.getBool('isLoggedIn')!;
    notifyListeners();
  }

  bool get getIsLoggedIn {
    return _isLoggedIn;
  }

  void setIsLoggedIn(bool isLogin) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isLoggedIn', isLogin);
    _isLoggedIn = isLogin;
    notifyListeners();
  }

  void setIsDark(bool isDark) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('isDark', isDark);
    _isDark = isDark;
    notifyListeners();
  }

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    setIsDark(!_isDark);
    notifyListeners();
  }
}
