import 'dart:developer';
import 'package:e_commerce/helper/routes/route_names.dart';
import 'package:e_commerce/screens/signin_page/controller/service/signin_service.dart';
import 'package:e_commerce/screens/signin_page/model/login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInProvider with ChangeNotifier {
  SignInProvider() {
    clearControllers();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  bool isNotVisible = true;
  bool passwordHidden = true;
  bool loading = false;
  FlutterSecureStorage storage= const FlutterSecureStorage();

  void clearControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    isNotVisible = true;
  }

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your User Name';
    } else if (value.length>=4) {
      return 'Enter valid User name';
    } else {
      return null;
    }
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the password';
    } else if (value.length < 6) {
      return 'The password must contain atleast 6 charactors';
    } else {
      return null;
    }
  }

  void togglePassword() {
    passwordHidden = !passwordHidden;
    notifyListeners();
  }

  void login(context) async {
    loading = true;
    notifyListeners();
    final LoginModel model = LoginModel(
      email: emailController.text,
      password: passwordController.text,
    );
    SignInService().login(model).then((value) {
      if (value != null) {
        log(value.accessToken.toString());
        log(value.refreshToken.toString());
        storage.write(key: 'accessToken', value: value.accessToken);
        storage.write(key: 'refreshToken', value: value.refreshToken);
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteNames.homePage, (route) => false);
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  void toForgotPasswordScreen(context) {
    emailController.clear();
    passwordController.clear();
    Navigator.of(context).pushNamed(RouteNames.findMyAccount);
  }

  googleLogin() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      var result = await googleSignIn.signIn();
      //need to chang this 
      return result;

    } catch (error) {
      // print(error);
      log(error.toString());
    }
  }
}
