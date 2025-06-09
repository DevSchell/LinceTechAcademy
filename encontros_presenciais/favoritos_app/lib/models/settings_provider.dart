import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:favoritos/pages/settings_page.dart';

class SettingsProvider with ChangeNotifier {
  Color _bgColor = Colors.white;
  Color _appBarColor = Colors.blue;
  bool _isLoading = false;

  Color get bgColor => _bgColor;
  Color get appBarColor => _appBarColor;
  bool get isLoading => _isLoading;

  Future<void> loadPreferences() async {
    _isLoading = true;
    notifyListeners();

    _bgColor = await UserPrefs.getBackgroundColor();
    _appBarColor = await UserPrefs.getAppBarColor();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> editBackgroundColor (Color cor) async {
    _bgColor = cor;
    await UserPrefs.setBackgroundColor(cor);
    notifyListeners();
  }

  Future<void> editAppBarColor(Color cor) async {
    _appBarColor = cor;
    await UserPrefs.setAppBarColor(cor);
    notifyListeners();
  }

}

class UserPrefs {
  static const _backgroundColorKey = "backgroundColor";
  static const _appbarColorKey = "appBarColor";

  static Future<void> setBackgroundColor(Color cor) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_backgroundColorKey, cor.value);
  }

  static Future<void> setAppBarColor (Color cor) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_appbarColorKey, cor.value);
  }

  static Future<Color> getBackgroundColor() async {
    final prefs = await SharedPreferences.getInstance();
    int? corValue = prefs.getInt(_backgroundColorKey);
    return Color(corValue ?? Colors.white.value); //Aq eu to deixando branco como padrão
  }

  static Future<Color> getAppBarColor() async {
    final prefs = await SharedPreferences.getInstance();
    int? corValue = prefs.getInt(_appbarColorKey);
    return Color(corValue ?? Colors.blue.value); //Aq eu tô deixando azul como padrão do app
  }

}