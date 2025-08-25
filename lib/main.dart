import 'package:flutter/material.dart';
import 'package:skycast/screens/hourely_foreCastItem.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: WheatherScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
