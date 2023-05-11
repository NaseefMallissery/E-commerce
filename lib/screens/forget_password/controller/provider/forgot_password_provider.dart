import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/routes/route_names.dart';
import 'package:e_commerce/screens/forget_password/controller/services/forgot_password_service.dart';
import 'package:e_commerce/helper/utils/app_toast.dart';
import 'package:e_commerce/screens/otp/controller/service/otp_service.dart';
import 'package:e_commerce/screens/otp/model/otp_arguement_model.dart';
import 'package:e_commerce/screens/otp/model/otp_enum.dart';
import 'package:flutter/cupertino.dart';

class ForgotPasswordProvider with ChangeNotifier {
  bool loading = false;
  final TextEditingController findAccountController = TextEditingController();

  void toOtpScreen(context, FormState currentState) {
    if (currentState.validate()) {
      loading = true;
      notifyListeners();
      ForgotPasswordService().getUser(findAccountController.text).then((model) {
        if (model != null) {
          OtpService().sendOtp(model.email).then((value) {
            if (value != null) {
              final args = OtpArguementModel(
                  model: model, checkScreen: OtpScreenEnum.forgotOtpScreen);
              Navigator.of(context).pushNamed(
                RouteNames.otpPage,
                arguments: args,
              );
              loading = false;
              notifyListeners();
            } else {
              loading = false;
              notifyListeners();
            }
          });
        } else {
          loading = false;
          notifyListeners();
          AppToast.showToast('No user Found', AppColors.redColor);
        }
      });
    }
  }

  String? findAccountTextfieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter correct email';
    } else {
      return null;
    }
  }
}
