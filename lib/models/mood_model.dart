import 'package:flutter/material.dart';
import 'dart:math';

class MoodModel extends ChangeNotifier {
  String _currentMood = 'assets/images/happy.png'; // Default: Happy
  Color _backgroundColor = Colors.white;
  final Map<String, int> _moodCounts = {
    'Happy': 0,
    'Sad': 0,
    'Excited': 0,
  };
  final List<String> _moodHistory = [];

  // Getters
  String get currentMood => _currentMood;
  Color get backgroundColor => _backgroundColor;
  Map<String, int> get moodCounts => _moodCounts;
  List<String> get moodHistory => _moodHistory;

  void _updateMood(String imagePath, String name, Color color) {
    _currentMood = imagePath;
    _backgroundColor = color;
    _moodCounts[name] = (_moodCounts[name] ?? 0) + 1;
    
    _moodHistory.add(imagePath);
    if (_moodHistory.length > 3) {
      _moodHistory.removeAt(0);
    }
    notifyListeners();
  }

  void setHappy() {
    _updateMood('assets/images/happy.png', 'Happy', Colors.yellow.shade100);
  }

  void setSad() {
    _updateMood('assets/images/sad.png', 'Sad', Colors.blue.shade100);
  }

  void setExcited() {
    _updateMood('assets/images/excited.png', 'Excited', Colors.orange.shade100);
  }

  void randomMood() {
    final moods = [setHappy, setSad, setExcited];
    moods[Random().nextInt(moods.length)]();
  }
}