// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';

// class FingerprintHomeScreen extends StatefulWidget {
//   const FingerprintHomeScreen({super.key});

//   @override
//   State<FingerprintHomeScreen> createState() => _FingerprintScreenState();
// }

// class _FingerprintScreenState extends State<FingerprintHomeScreen> {
//   final LocalAuthentication auth = LocalAuthentication();

//   String message = "Press the button to scan fingerprint";

//   Future<void> authenticate() async {
//     bool authenticated = false;

//     try {
//       authenticated = await auth.authenticate(
//         localizedReason: "Scan your fingerprint to unlock",
//         biometricOnly: true,
//         // stickyAuth: true,
//       );
//     } catch (e) {
//       print(e);
//     }

//     setState(() {
//       if (authenticated) {
//         message = "✅ Authentication Successful";
//       } else {
//         message = "❌ Authentication Failed";
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Fingerprint Authentication")),

//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,

//           children: [
//             const Icon(Icons.fingerprint, size: 100),

//             const SizedBox(height: 20),

//             Text(
//               message,
//               style: const TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ),

//             const SizedBox(height: 30),

//             ElevatedButton(
//               onPressed: authenticate,
//               child: const Text("Verify Fingerprint"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class FingerprintHomeScreen extends StatelessWidget {
  const FingerprintHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Welcome')));
  }
}
