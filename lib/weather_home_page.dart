import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton.outlined(
            onPressed: () {
              // print("Refresh");
            },
            icon: const Icon(
              Icons.refresh_rounded,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child:Card(
                color: Colors.white10,
                elevation: 10,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      // filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                           Text(
                            "300.12°F",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.cloud,
                            size: 30,
                          ),
                          Text(
                            "Rain",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: const Text(
                "Weather Forecast",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            //Adding the hourlyWeatherCard here
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: const Row(
                children: [
                  WeatherForecastCard(time: "10:00",icon:  Icons.cloud,temperature:  "300.12°F"),
                  WeatherForecastCard(time: "12:00",icon:  Icons.cloud_done,temperature:  "300.12°F"),
                  WeatherForecastCard(time: "14:00",icon:  Icons.cloud,temperature:  "300.12°F"),
                  WeatherForecastCard(time: "14:00",icon:  Icons.cloud,temperature:  "300.12°F"),
                  WeatherForecastCard(time: "14:00",icon:  Icons.cloud,temperature:  "300.12°F"),
                ],
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            Placeholder(
              fallbackHeight: 200,
              fallbackWidth: 200,
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherForecastCard extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temperature;
  const WeatherForecastCard({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115,
      height: 115,
      child: Card(
        color: Colors.white10,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [Text(time), Icon(icon), Text(temperature)],
        ),
      ),
    );
  }
}
