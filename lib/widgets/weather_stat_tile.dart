import 'package:flutter/material.dart';

class WeatherStatTile extends StatelessWidget {
  const WeatherStatTile({
    super.key,
    required this.icons,
    required this.label,
    required this.value,
  });
  final IconData icons;
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icons, size: 32),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}
