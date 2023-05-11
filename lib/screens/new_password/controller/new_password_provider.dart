import 'dart:developer';

import 'package:e_commerce/helper/routes/route_names.dart';
import 'package:e_commerce/screens/forget_password/controller/services/forgot_password_service.dart';
import 'package:e_commerce/screens/new_password/view/widget/success_dialouge.dart';
import 'package:flutter/material.dart';

class NewPasswordProvider with ChangeNotifier {
  final TextEditingController newPasswordcontroller = TextEditingController();
  final TextEditingController confirmPasswordContriller =
      TextEditingController();
  bool isVisible = false;
  bool loading = false;
  bool passwordHidden = true;

  void visibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter new password';
    } else if (value.length < 6) {
      return 'Password is too short';
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please re-enter your password';
    } else if (value != newPasswordcontroller.text) {
      log(newPasswordcontroller.toString());
      return 'Password do not match';
    } else {
      return null;
    }
  }

  void success(email,context) {
    loading = true;
    notifyListeners();
    ForgotPasswordService()
        .changePassword(email, newPasswordcontroller.text)
        .then((value) {
      log(value.toString());
      if (value != null) {
        loading = false;
        notifyListeners();
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (ctx) {
              return const SuccessDialouge();
            });
      }
    });
  }

  void togglePassword() {
    passwordHidden = !passwordHidden;
    notifyListeners();
  }

  void toSignInScreen(context) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.signInpage, (route) => false);
  }
}
