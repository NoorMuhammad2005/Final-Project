import 'package:local_auth/local_auth.dart';

class AuthService {
  final LocalAuthentication localAuth = LocalAuthentication();

  Future<bool> authenticatelocally() async {
    bool isAuthenticate = false;

    try {
      isAuthenticate = await localAuth.authenticate(
        localizedReason: "We need to authenticate for using this app.",

        // options: AuthenticationOptions(
        // )
      );
    } on LocalAuthException catch (e) {
      if (e.code == LocalAuthExceptionCode.noBiometricHardware) {
        // Add handling of no hardware here.
      } else if (e.code == LocalAuthExceptionCode.temporaryLockout ||
          e.code == LocalAuthExceptionCode.biometricLockout) {
        // ...
      } else {
        // ...
      }
    } catch (e) {
      print("Error: $e");
    }

    return isAuthenticate;
  }
}
