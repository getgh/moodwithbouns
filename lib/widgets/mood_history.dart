import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/mood_model.dart';

class MoodHistory extends StatelessWidget {
  const MoodHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MoodModel>(
      builder: (context, moodModel, child) => Card(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            children: [
              const Text('Mood History'),
              const SizedBox(height: 10),
              moodModel.moodHistory.isEmpty
                  ? const Text('No history yet')
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: moodModel.moodHistory
                          .map((mood) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Text(
                                  mood,
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ))
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}