import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:skycast/const/const_function.dart';

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "300.67°F",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                          Icon(Icons.cloud, size: 64),
                          Text("Rain", style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Weather ForeCast",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              SizedBox(height: 19),
              Placeholder(fallbackHeight: 150),
              SizedBox(height: 20),
              Placeholder(fallbackHeight: 150),
            ],
          ),
        ),
      ),
    );
  }
}
