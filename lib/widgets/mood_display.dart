import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/mood_model.dart';

class MoodDisplay extends StatelessWidget {
  const MoodDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MoodModel>(
      builder: (context, moodModel, child) => Container(
        padding: const EdgeInsets.all(20),
        child: Image.asset(
          moodModel.currentMood,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}