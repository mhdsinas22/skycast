import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skycast/services/api_service.dart';
import 'package:skycast/widgets/timewather_card.dart';
import 'package:skycast/widgets/weather_stat_tile.dart';

class WheatherScreen extends StatefulWidget {
  const WheatherScreen({super.key});

  @override
  State<WheatherScreen> createState() => _WheatherScreenState();
}

class _WheatherScreenState extends State<WheatherScreen> {
  Future<Map<String, dynamic>> weather = ApiService.getwheatherfromapi();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weather = ApiService.getwheatherfromapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "SkyCast",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                weather = ApiService.getwheatherfromapi();
              });
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          // final data = snapshot.data;
          // final wheatherlist = data![0]["list"];
          // final temp = wheatherlist["main"]["temp"];
          final data = snapshot.data;
          final weatherlist = data!["list"][0];
          final temp = weatherlist["main"]["temp"];
          final checkweather = weatherlist["weather"][0]["main"];
          final humidity = weatherlist["main"]["humidity"];
          final windspeed = weatherlist["wind"]["speed"];
          final pressure = weatherlist["main"]["pressure"];
          return Center(
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
                                "$temp K",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                              ),
                              Icon(
                                checkweather == "Rain" ||
                                        checkweather == "Clouds"
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 64,
                              ),
                              Text(
                                checkweather,
                                style: TextStyle(fontSize: 20),
                              ),
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
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        final timelabel = data["list"][index]["dt_txt"];
                        final DateTime dateTime = DateTime.parse(timelabel);
                        final wheather =
                            data["list"][index]["weather"][0]["main"];
                        final temperture = data["list"][index]["main"]["temp"];
                        return HourelyForeCastItem(
                          timelabel: DateFormat.j().format(dateTime),
                          icon:
                              wheather == "Clouds" || wheather == "Rain"
                                  ? Icons.cloud
                                  : Icons.sunny,
                          temperature: temperture.toString(),
                        );
                      },
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
                        value: humidity.toString(),
                      ),
                      WeatherStatTile(
                        icons: Icons.air,
                        label: "Wind Speed",
                        value: windspeed.toString(),
                      ),
                      WeatherStatTile(
                        icons: Icons.beach_access,
                        label: "Pressure",
                        value: pressure.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
