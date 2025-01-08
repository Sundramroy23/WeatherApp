import 'dart:ui';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class HourlyWeatherCardData {
  String time;
  String temperature;
  String icon;
  HourlyWeatherCardData(this.time, this.temperature, this.icon);
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  String temperature = '';
  String condition = '';
  String location = '';
  String iconUrl = '';
  String wind = '';
  String humidity = '';
  String pressure = '';
  List<HourlyWeatherCardData> hourlyWeatherCardData = [];
  Future<void> fetchWeatherData() async {
    try {
      final String urlForcast =
          "https://api.weatherapi.com/v1/forecast.json?key=${dotenv.env['API_KEY']}&q=Pune&days=1";
      final response = await http.get(Uri.parse(urlForcast));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          temperature = "${data['current']['temp_c']}°C";
          condition = data['current']['condition']['text'];
          location = data['location']['name'];
          // iconUrl = "http:${data['current']['condition']['icon']}";
          iconUrl = "https:${data['current']['condition']['icon']}";
          wind = data['current']['wind_kph'].toString();
          pressure = data['current']['pressure_mb'].toString();
          humidity = data['current']['humidity'].toString();
          hourlyWeatherCardData.clear(); // Clear previous data
          for (var hour in data['forecast']['forecastday'][0]['hour']) {
            hourlyWeatherCardData.add(
              HourlyWeatherCardData(
                hour['time'].toString().split(" ")[1],
                "${hour['temp_c']}°C",
                // "https://cdn.weatherapi.com/weather/64x64/night/113.png",
                "https:${hour['condition']['icon']}",
              ),
            );
          }
        });
      } else {
        // print("Error: ${response.statusCode}");
      }
    } catch (e) {
      // print("Exception: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                fetchWeatherData();
              });
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
              child: Card(
                color: Colors.white10,
                elevation: 10,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            temperature,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Image.network(
                            iconUrl,
                            width: 60.0,
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            condition,
                            style: const TextStyle(fontSize: 20),
                          ),
                          // Text(
                          //   location,
                          //   style: const TextStyle(
                          //       fontSize: 18, fontWeight: FontWeight.w500),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Weather Forecast",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hourlyWeatherCardData.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = hourlyWeatherCardData[index];
                  return WeatherForecastCard(
                    time: data.time,
                    icon: data.icon,
                    temperature: data.temperature,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Additional Information",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AdditionalInformationTile(
                  icon: Icons.water_drop,
                  title: "Humidity",
                  subtitle: "$humidity%",
                ),
                AdditionalInformationTile(
                  icon: Icons.speed,
                  title: "Pressure",
                  subtitle: "$pressure mb",
                ),
                AdditionalInformationTile(
                  icon: Icons.air,
                  title: "Wind",
                  subtitle: "$wind kph",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherForecastCard extends StatelessWidget {
  final String time;
  final String icon;
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
      width: 120,
      height: 150,
      child: Card(
        color: Colors.white10,
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Image.network(
              // 'https://cdn.weatherapi.com/weather/64x64/night/113.png',
              icon,
              width: 60.0,
              height: 60.0,
              fit: BoxFit.cover,
            ),
            Text(temperature),
          ],
        ),
      ),
    );
  }
}

class AdditionalInformationTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const AdditionalInformationTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Card(
        color: Colors.white10,
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}
