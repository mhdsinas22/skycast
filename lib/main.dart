import 'package:flutter/material.dart';

import 'package:skycast/screens/hourely_foreCastItem.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: WheatherScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
