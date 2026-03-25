import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String city = "Karachi";
  double temp = 0;
  String weather = "";
  int humidity = 0;
  bool loading = true;

  final TextEditingController cityController = TextEditingController();
  List<String> cities = [];

  @override
  void initState() {
    super.initState();
    loadCities();
    getWeather(city); // default city
  }

  // Load cities from JSON
  Future<void> loadCities() async {
    final String jsonString = await rootBundle.loadString(
      'assets/city.list.json',
    );
    final List<dynamic> jsonData = jsonDecode(jsonString);
    setState(() {
      // Make sure to only extract "name" from each city object
      cities = jsonData.map((c) => c["name"].toString()).toList();
    });
    print("Total cities loaded: ${cities.length}");
  }

  Future<void> getWeather(String cityName) async {
    setState(() {
      loading = true;
    });

    final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=6f44e64847b7e658be21932c74dfa334&units=metric",
    );

    try {
      final response = await http.get(url);
      final data = jsonDecode(response.body);

      if (data.containsKey("main")) {
        setState(() {
          city = cityName;
          temp = data["main"]["temp"];
          weather = data["weather"][0]["main"];
          humidity = data["main"]["humidity"];
          loading = false;
        });
      } else {
        setState(() {
          loading = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("City not found!")));
      }
    } catch (e) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Error fetching weather")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // TypeAhead TextField
            TypeAheadField<String>(
              suggestionsCallback: (pattern) {
                return cities
                    .where(
                      (c) => c.toLowerCase().startsWith(pattern.toLowerCase()),
                    )
                    .take(10)
                    .toList();
              },
              builder: (context, controller, focusNode) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    labelText: 'Enter city name',
                    border: OutlineInputBorder(),
                  ),
                );
              },
              itemBuilder: (context, String suggestion) {
                return ListTile(title: Text(suggestion));
              },
              onSelected: (String suggestion) {
                getWeather(suggestion);
              },
            ),

            const SizedBox(height: 30),

            // Weather info
            loading
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        city,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${temp.toStringAsFixed(1)} °C",
                        style: const TextStyle(fontSize: 40),
                      ),
                      const SizedBox(height: 10),
                      Text(weather, style: const TextStyle(fontSize: 25)),
                      const SizedBox(height: 10),
                      Text(
                        "Humidity: $humidity%",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
