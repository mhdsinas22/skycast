import 'dart:ui';

import 'package:flutter/material.dart';

class HourelyForeCastItem extends StatelessWidget {
  const HourelyForeCastItem({
    super.key,
    required this.timelabel,
    required this.icon,
    required this.temperature,
  });

  final String timelabel;
  final IconData icon;
  final String temperature;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Column(
                children: [
                  Text(
                    timelabel,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Icon(icon, size: 32),
                  SizedBox(height: 8),
                  Text(temperature),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
