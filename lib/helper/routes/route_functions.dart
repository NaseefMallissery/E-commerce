import 'package:e_commerce/helper/routes/route_names.dart';
import 'package:e_commerce/screens/cart_page/view/cart_page.dart';
import 'package:e_commerce/screens/forget_password/view/forgot_password_page.dart';
import 'package:e_commerce/screens/new_password/model/new_pass_arg_model.dart';
import 'package:e_commerce/screens/new_password/view/new_password.dart';
import 'package:e_commerce/screens/home_page/view/home_page.dart';
import 'package:e_commerce/screens/otp/model/otp_arguement_model.dart';
import 'package:e_commerce/screens/otp/view/otp_page.dart';
import 'package:e_commerce/screens/product_view/model/product_view_model.dart';
import 'package:e_commerce/screens/product_view/view/product_view_page.dart';
import 'package:e_commerce/screens/profile/view/profile_page.dart';
import 'package:e_commerce/screens/signin_page/view/signin_page.dart';
import 'package:e_commerce/screens/sing_up_page/view/sign_up_page.dart';
import 'package:e_commerce/screens/splash_screeen/view/splash_screen.dart';
import 'package:e_commerce/screens/wish_list/view/favorite_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.signUpPage:
        return MaterialPageRoute(
          builder: (context) => SignUpPage(),
        );
      case RouteNames.signInpage:
        return MaterialPageRoute(
          builder: (context) => SignInPage(),
        );
      case RouteNames.otpPage:
        final args = settings.arguments as OtpArguementModel;
        return MaterialPageRoute(
            builder: (context) => OtpPage(
                  model: args.model,
                  screenCheck: args.checkScreen,
                ));
      case RouteNames.newPasswordPage:
        final args = settings.arguments as NewPasswordScreenArguementsModel;
        return MaterialPageRoute(
          builder: (context) => NewPasswordPage(
            model: args.model,
          ),
        );
      case RouteNames.findMyAccount:
        return MaterialPageRoute(
          builder: (context) => ForgotPasswordPage(),
        );
      case RouteNames.homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case RouteNames.favoritePage:
        return MaterialPageRoute(
          builder: (context) => const WishListScreen(),
        );
      case RouteNames.productViewPage:
        final args = settings.arguments as ProductIdModel;
        return MaterialPageRoute(
          builder: (context) => ProductViewPage(productId: args.productId),
        );
      case RouteNames.profile:
        return MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        );
      case RouteNames.cartPage:
        return MaterialPageRoute(
          builder: (context) => const CartPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
