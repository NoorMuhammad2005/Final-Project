import 'package:final_task/Screens/FingerPrint/auth_page.dart';
import 'package:final_task/Screens/FingerPrint/fingerprint_screen.dart';
import 'package:final_task/Screens/ads_screen.dart';
import 'package:final_task/Screens/audio_screen.dart';
import 'package:final_task/Screens/map_screen.dart';
import 'package:final_task/Screens/notification_screen.dart';
import 'package:final_task/Screens/payment_screen.dart';
import 'package:final_task/Screens/qr_screen.dart';
import 'package:final_task/Screens/scanner_screen.dart';
import 'package:final_task/Screens/video_screen.dart';
import 'package:final_task/Screens/weather_screen.dart';
import 'package:final_task/webview_screen.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatelessWidget {
  final List features = [
    {"name": "Google Map", "screen": Map_Screen()},
    {"name": "Weather", "screen": WeatherScreen()},
    {"name": "Camera Scanner", "screen": Scanner_Screen()},
    {"name": "Fingerprint Scan", "screen": AuthPage()},
    {"name": "Audio Recording", "screen": Audio_Screen()},
    {"name": "Video Recording", "screen": Video_Screen()},
    {"name": "Push Notification", "screen": Notification_Screen()},
    {"name": "Stripe Payment", "screen": Payment_Screen()},
    {"name": "WebView", "screen": Webview_Screen()},
    {"name": "QR Code Scanner", "screen": QR_Screen()},
    {"name": "Google Map", "screen": Ads_Screen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Features App")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: features.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => features[index]["screen"],
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  features[index]["name"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
