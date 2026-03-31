import 'package:final_task/Screens/FingerPrint/auth_service.dart';
import 'package:final_task/Screens/FingerPrint/fingerprint_screen.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Auth Page')),
      body: Center(
        child: IconButton(
          onPressed: () async {
            bool check = await AuthService().authenticatelocally();
            if (check) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FingerprintHomeScreen(),
                ),
              );
            }
          },
          icon: Icon(Icons.fingerprint, size: 70),
        ),
      ),
    );
  }
}
