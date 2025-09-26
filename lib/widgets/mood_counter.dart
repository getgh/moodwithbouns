import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/mood_model.dart';

class MoodCounter extends StatelessWidget {
  const MoodCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MoodModel>(
      builder: (context, moodModel, child) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildCounter('Happy 😊', moodModel.moodCounts['Happy'] ?? 0),
              const SizedBox(width: 20),
              _buildCounter('Sad 😞', moodModel.moodCounts['Sad'] ?? 0),
              const SizedBox(width: 20),
              _buildCounter('Excited 🥳', moodModel.moodCounts['Excited'] ?? 0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCounter(String label, int count) {
    return Column(
      children: [
        Text(label),
        Text(
          count.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}