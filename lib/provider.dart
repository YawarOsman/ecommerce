import 'package:flutter/material.dart';
class ClassProvider extends ChangeNotifier {
  static bool _isDark = false;
  static bool _isLoggedIn = false;

  bool get getIsDark {
    return _isDark;
  }

  bool get getIsLoggedIn {
    return _isLoggedIn;
  }

  void setIsLoggedIn(bool isLogin) {
    _isLoggedIn = isLogin;
    notifyListeners();
  }

  void setIsDark(bool isDark) {
    _isDark = isDark;
    notifyListeners();
  }

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
