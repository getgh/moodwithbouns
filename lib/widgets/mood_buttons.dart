import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/mood_model.dart';

class MoodButtons extends StatelessWidget {
  const MoodButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildMoodButton(
          context,
          'Happy',
          'assets/images/happy.png',
          () => Provider.of<MoodModel>(context, listen: false).setHappy(),
        ),
        _buildMoodButton(
          context,
          'Sad',
          'assets/images/sad.png',
          () => Provider.of<MoodModel>(context, listen: false).setSad(),
        ),
        _buildMoodButton(
          context,
          'Excited',
          'assets/images/excited.png',
          () => Provider.of<MoodModel>(context, listen: false).setExcited(),
        ),
        ElevatedButton.icon(
          onPressed: () {
            Provider.of<MoodModel>(context, listen: false).randomMood();
          },
          icon: const Icon(Icons.shuffle),
          label: const Text('Random'),
        ),
      ],
    );
  }

  Widget _buildMoodButton(
    BuildContext context,
    String label,
    String imagePath,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}