import 'package:final_task/Screens/Scanner/scanner_homeviewmodel.dart';
import 'package:final_task/Screens/app_screnns.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:stacked/stacked.dart';

class Scanner_HomeView extends StatelessWidget {
  const Scanner_HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Scanner_HomeViewModel>.reactive(
      viewModelBuilder: () => Scanner_HomeViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(title: const Text(AppStrings.appName)),
          body: Column(
            children: [
              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    MobileScanner(
                      onDetect: (BarcodeCapture capture) {
                        final List<Barcode> barcodes = capture.barcodes;

                        for (final barcode in barcodes) {
                          final String? code = barcode.rawValue;

                          if (code != null) {
                            model.setResult(code);
                            break;
                          }
                        }
                      },
                    ),

                    // Scanner overlay box
                    Center(
                      child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      model.scannedResult,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),

                    ElevatedButton(
                      onPressed: model.resetScan,
                      child: const Text("Scan Again"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
