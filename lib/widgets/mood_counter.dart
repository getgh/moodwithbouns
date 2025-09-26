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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCounter(
                context,
                'Happy',
                'assets/images/happy.png',
                moodModel.moodCounts['Happy'] ?? 0,
              ),
              const SizedBox(width: 20),
              _buildCounter(
                context,
                'Sad',
                'assets/images/sad.png',
                moodModel.moodCounts['Sad'] ?? 0,
              ),
              const SizedBox(width: 20),
              _buildCounter(
                context,
                'Excited',
                'assets/images/excited.png',
                moodModel.moodCounts['Excited'] ?? 0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCounter(
    BuildContext context,
    String label,
    String imagePath,
    int count,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imagePath,
          width: 32,
          height: 32,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
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
