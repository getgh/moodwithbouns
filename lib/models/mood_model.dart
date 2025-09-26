import 'package:flutter/material.dart';
import 'dart:math';

class MoodModel extends ChangeNotifier {
  String _currentMood = '😊';
  Color _backgroundColor = Colors.white;
  final Map<String, int> _moodCounts = {
    'Happy': 0,
    'Sad': 0,
    'Excited': 0,
  };
  final List<String> _moodHistory = [];

  String get currentMood => _currentMood;
  Color get backgroundColor => _backgroundColor;
  Map<String, int> get moodCounts => _moodCounts;
  List<String> get moodHistory => _moodHistory;

  void _updateMood(String mood, String name, Color color) {
    _currentMood = mood;
    _backgroundColor = color;
    _moodCounts[name] = (_moodCounts[name] ?? 0) + 1;
    
    _moodHistory.add(mood);
    if (_moodHistory.length > 3) {
      _moodHistory.removeAt(0);
    }
    notifyListeners();
  }

  void setHappy() {
    _updateMood('😊', 'Happy', Colors.yellow.shade200);
  }

  void setSad() {
    _updateMood('😢', 'Sad', Colors.blue.shade200);
  }

  void setExcited() {
    _updateMood('🥳', 'Excited', Colors.orange.shade100);
  }

  void randomMood() {
    final moods = [setHappy, setSad, setExcited];
    moods[Random().nextInt(moods.length)]();
  }
}