import 'package:flutter/material.dart';

class WheatherScreen extends StatelessWidget {
  const WheatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "SkyCast",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
    );
  }
}
