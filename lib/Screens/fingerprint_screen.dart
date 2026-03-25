import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintScreen extends StatefulWidget {
  const FingerprintScreen({super.key});

  @override
  State<FingerprintScreen> createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
  final LocalAuthentication auth = LocalAuthentication();

  String message = "Press the button to scan fingerprint";

  Future<void> authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await auth.authenticate(
        localizedReason: "Scan your fingerprint to unlock",
        biometricOnly: true,
        // stickyAuth: true,
      );
    } catch (e) {
      print(e);
    }

    setState(() {
      if (authenticated) {
        message = "✅ Authentication Successful";
      } else {
        message = "❌ Authentication Failed";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fingerprint Authentication")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Icon(Icons.fingerprint, size: 100),

            const SizedBox(height: 20),

            Text(
              message,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: authenticate,
              child: const Text("Verify Fingerprint"),
            ),
          ],
        ),
      ),
    );
  }
}
