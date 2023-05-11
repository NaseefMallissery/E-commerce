import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/screens/splash_screeen/controller/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashProvider = Provider.of<SplashProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      splashProvider.splash(context);
    });
    return  SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.themeColor,
        extendBodyBehindAppBar: true,
        body: Center(
          child: Column(
            children: [
              Image.asset('asset/images/logo (2).png'),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(223, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
