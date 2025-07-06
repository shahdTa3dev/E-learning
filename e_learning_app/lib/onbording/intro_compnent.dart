import 'Intro_item_data.dart';
import 'package:flutter/material.dart';

class IntroItemWidget extends StatelessWidget {
  final IntroItemData data;

  const IntroItemWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(data.imagePath, height: 250),
        const SizedBox(height: 30),
        Text(
          data.title,
          style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            data.description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }
}
