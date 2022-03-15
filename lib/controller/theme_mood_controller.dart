import 'package:flutter/cupertino.dart';

class ThemeMoodController extends ChangeNotifier {
  bool darkMood = false;

  getDarkMood() {
    darkMood = true;
    notifyListeners();
  }

  getLightMood() {
    darkMood = false;
    notifyListeners();
  }
}
