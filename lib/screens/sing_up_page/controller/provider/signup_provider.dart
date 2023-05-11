import 'dart:developer';

import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/routes/route_names.dart';
import 'package:e_commerce/screens/forget_password/controller/services/forgot_password_service.dart';
import 'package:e_commerce/helper/utils/app_toast.dart';
import 'package:e_commerce/screens/otp/controller/service/otp_service.dart';
import 'package:e_commerce/screens/otp/model/otp_arguement_model.dart';
import 'package:e_commerce/screens/otp/model/otp_enum.dart';
import 'package:e_commerce/screens/sing_up_page/model/signup_model.dart';
import 'package:flutter/cupertino.dart';

class SignUpProvider with ChangeNotifier {
  SignUpProvider() {
    clearControllers();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isNotVisible = true;
  bool loading = false;
  bool passwordHidden = true;

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your name';
    } else {
      return null;
    }
  }

  void clearControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    isNotVisible = true;
  }

  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your E-mail';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter valid E-mail address';
    } else {
      return null;
    }
  }

  String? numberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your phone number';
    } else if (value.length != 10) {
      return 'Enter a valid phone number';
    } else {
      return null;
    }
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your password';
    } else if (value.length < 6) {
      return 'The password must contain atleast 6 charactors';
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your password again';
    } else if (value != passwordController.text) {
      return "Password doesn't match";
    } else {
      return null;
    }
  }

  // void passwordHide() {
  //   isNotVisible = !isNotVisible;
  //   notifyListeners();
  // }

  void togglePassword() {
    passwordHidden = !passwordHidden;
    notifyListeners();
  }

void toSignUpOtpScreen(context, FormState currentState) async {
    final SignUpModel model = SignUpModel(
      fullName: nameController.text,
      email: emailController.text,
      number: numberController.text,
      password: passwordController.text,
    );
    final args = OtpArguementModel(
        model: model, checkScreen: OtpScreenEnum.signUpOtpScreen);
    if (currentState.validate()) {
      log('toSignUpOtpScreen is validate');
      loading = true;
      notifyListeners();
      await ForgotPasswordService()
          .getUser(emailController.text)
          .then((value) async {
        if (value == null) {
          await OtpService().sendOtp(emailController.text).then((value) {
            log(value.toString());
            if (value != null) {
              Navigator.of(context)
                  .pushNamed(RouteNames.otpPage, arguments: args)
                  .then((value) {
                loading = false;
                notifyListeners();
              });
            } else {
              return null;
            }
          });
        } else {
          AppToast.showToast('User already exists', AppColors.redColor);
        }
      });
      loading = false;
      notifyListeners();
    }
  }
}
