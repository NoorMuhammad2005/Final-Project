import 'package:stacked/stacked.dart';

class Scanner_HomeViewModel extends BaseViewModel {
  String scannedResult = "Scan a QR Code";
  bool isScanned = false;

  void setResult(String value) {
    if (!isScanned) {
      scannedResult = value;
      isScanned = true;
      notifyListeners();
    }
  }

  void resetScan() {
    scannedResult = "Scan a QR Code";
    isScanned = false;
    notifyListeners();
  }
}
