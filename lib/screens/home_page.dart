import 'package:flutter/material.dart';
import '../widgets/mood_display.dart';
import '../widgets/mood_buttons.dart';
import '../widgets/mood_counter.dart';
import '../widgets/mood_history.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Tracker'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MoodDisplay(),
            const SizedBox(height: 40),
            const MoodButtons(),
            const SizedBox(height: 20),
            const MoodCounter(),
            const SizedBox(height: 20),
            const MoodHistory(),
          ],
        ),
      ),
    );
  }
}