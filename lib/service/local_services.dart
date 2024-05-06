import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class BiometricAuthService{
  static LocalAuthentication auth=LocalAuthentication();

  static Future<bool> canAuthenticate()async{
    final bool canAuthenticateBiometrics = await auth.canCheckBiometrics;

    final bool canAuthenticate =
        canAuthenticateBiometrics || await auth.isDeviceSupported();

    if (canAuthenticate){
      List<BiometricType> types =await auth.getAvailableBiometrics();
      if(types.isNotEmpty) return true;
    }

    return false;
  }
  static Future <bool> authenticate()async{
    try{
      return await auth.authenticate(localizedReason: "Barmoq izini faollashtiring",
          options: const AuthenticationOptions(
            useErrorDialogs: false,
            stickyAuth: true,
            biometricOnly: true,
          )
      );
    }on PlatformException catch (e){
      debugPrint("Biometrics Error:${e.code}");
      if (e.code == auth_error.notAvailable){
      }else if ( e.code == auth_error.notEnrolled){
      }else{}
      return false;
    }
  }
}