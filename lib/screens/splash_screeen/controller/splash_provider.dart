import 'package:e_commerce/helper/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? onboardValue;
  String? signInValue;

  void splash(context) async {
    await Future.delayed(
      const Duration(seconds: 4),
    );
    onboardValue = await storage.read(key: 'onboard');
    signInValue = await storage.read(key: 'token');

    // if (signInValue != null) {
    //   Navigator.pushNamedAndRemoveUntil(
    //       context, RouteNames.homePage, (route) => false);
    // } else if(onboardValue ==null){
    Navigator.pushNamedAndRemoveUntil(
        context, RouteNames.signInpage, (route) => false);
    //  }  
  }
}
