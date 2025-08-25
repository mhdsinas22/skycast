import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:skycast/widgets/timewather_card.dart';
import 'package:skycast/widgets/weather_stat_tile.dart';

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
                            "300.67K",
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
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Weather ForeCast",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HourelyForeCastItem(
                      timelabel: "00:00",
                      icon: Icons.cloud,
                      temperature: "301.17",
                    ),
                    HourelyForeCastItem(
                      timelabel: "9:00",
                      icon: Icons.sunny,
                      temperature: "300.52",
                    ),
                    HourelyForeCastItem(
                      timelabel: "12:00",
                      icon: Icons.cloud,
                      temperature: "302.22",
                    ),
                    HourelyForeCastItem(
                      timelabel: "09:00",
                      icon: Icons.cloud,
                      temperature: "300.12",
                    ),
                    HourelyForeCastItem(
                      timelabel: "00:00",
                      icon: Icons.cloud,
                      temperature: "300.42",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WeatherStatTile(
                    icons: Icons.water_drop,
                    label: "Humidity",
                    value: "94",
                  ),
                  WeatherStatTile(
                    icons: Icons.air,
                    label: "Wind Speed",
                    value: "7.57",
                  ),
                  WeatherStatTile(
                    icons: Icons.beach_access,
                    label: "Pressure",
                    value: "1009",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
