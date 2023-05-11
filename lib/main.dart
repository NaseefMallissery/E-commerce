import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/screens/cart_page/controller/provider/cart_provider.dart';
import 'package:e_commerce/screens/forget_password/controller/provider/forgot_password_provider.dart';
import 'package:e_commerce/screens/home_page/controller/provider/home_provider.dart';
import 'package:e_commerce/screens/new_password/controller/new_password_provider.dart';
import 'package:e_commerce/screens/otp/controller/provider/otp_page_provider.dart';
import 'package:e_commerce/screens/product_view/controller/provider/payment_screen_provider.dart';
import 'package:e_commerce/screens/product_view/controller/provider/product_provider.dart';
import 'package:e_commerce/screens/signin_page/controller/provider/signin_provider.dart';
import 'package:e_commerce/screens/sing_up_page/controller/provider/signup_provider.dart';
import 'package:e_commerce/screens/splash_screeen/controller/splash_provider.dart';
import 'package:e_commerce/screens/splash_screeen/view/splash_screen.dart';
import 'package:e_commerce/screens/wish_list/controller/provider/wish_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helper/routes/route_functions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        ChangeNotifierProvider(create: (context) => SignInProvider()),
        ChangeNotifierProvider(create: (context) => SignUpProvider()),
        ChangeNotifierProvider(create: (context) => OtpProvider()),
        ChangeNotifierProvider(create: (context) => NewPasswordProvider()),
        ChangeNotifierProvider(create: (context) => ForgotPasswordProvider()),
        ChangeNotifierProvider(create: (context) => HomePageProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => PaymentProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => WishListProvider()),
      ],
      child: MaterialApp(
       
        theme: ThemeData(
          primaryColor: AppColors.themeColor,
          // primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
      ),
    );
  }
}
