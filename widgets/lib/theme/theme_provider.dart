import 'package:flutter/material.dart';
import 'package:widgets/theme/light_dark_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}

// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class DarkModeNotifier extends StateNotifier<bool> {
//   DarkModeNotifier() : super(false);

//   void toggle() {
//     state = !state;
//   }
// }

// final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>(
//   (ref) => DarkModeNotifier(),
// );
