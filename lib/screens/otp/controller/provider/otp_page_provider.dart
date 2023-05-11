import 'dart:async';
import 'dart:developer';
import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/routes/route_names.dart';
import 'package:e_commerce/helper/utils/app_toast.dart';
import 'package:e_commerce/screens/new_password/model/new_pass_arg_model.dart';
import 'package:e_commerce/screens/otp/controller/service/otp_service.dart';
import 'package:e_commerce/screens/otp/model/otp_enum.dart';
import 'package:e_commerce/screens/sing_up_page/controller/service/signup_service.dart';
import 'package:e_commerce/screens/sing_up_page/model/signup_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OtpProvider with ChangeNotifier {
  int timeRemaining = 59;
  Timer? timer;
  bool enableResend = false;
  bool clear = false;
  bool otpDone = false;
  String code = '';
  bool loading = false;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  void setResendVisibility(bool newValue, context, String email) {
    clear = true;
    notifyListeners();
    OtpService().sendOtp(email).then((value) {
      if (value != null) {
        clear = false;
        notifyListeners();
        enableResend = newValue;
        timeRemaining = 30;
      } else {
        return null;
      }
    });
  }

  void setCode(String newCode) {
    code = newCode;
    log('newcode ${code.toString()}');
    notifyListeners();
  }

  // void verifyCode(context, SignUpModel model, OtpScreenEnum screenChek) async {
  //   log(model.email.toString());
  //   if (code.length != 4) {
  //     AppToast.showToast('Please enter OTP', AppColors.redColor);
  //   } else {
  //     if (timeRemaining == 0) {
  //       AppToast.showToast('Otp timedout', AppColors.redColor);
  //     } else {
  //       loading = true;
  //       notifyListeners();
  //       if (screenChek == OtpScreenEnum.forgotOtpScreen) {
  //         await OtpService().verifyOtp(code, model.email).then((value) {
  //           if (value != null) {
  //             final args = NewPasswordScreenArguementsModel(model: model);
  //             Navigator.of(context)
  //                 .pushReplacementNamed(RouteNames.newPasswordPage,
  //                     arguments: args)
  //                 .then((value) {
  //               loading = false;
  //               notifyListeners();
  //             });
  //           } else {
  //             null;
  //             loading = false;
  //             notifyListeners();
  //           }
  //         });
  //       } else if (screenChek == OtpScreenEnum.signUpOtpScreen) {
  //         await OtpService().verifyOtp(code, model.email).then((value) async {
  //           if (value != null) {
  //             await SignUpService().signUp(model, context).then((value) async {
  //               if (value != null) {
  //                 await storage.write(key: 'token', value: value.accessToken);
  //                 await storage.write(
  //                     key: 'refreshToken', value: value.refreshToken);
  //                 Navigator.of(context).pushNamedAndRemoveUntil(
  //                     RouteNames.homePage, (route) => false);
  //                 loading = false;
  //                 notifyListeners();
  //               } else {
  //                 loading = false;
  //                 notifyListeners();
  //               }
  //             });
  //           } else {
  //             null;
  //             loading = false;
  //             notifyListeners();
  //           }
  //         });
  //       }
  //       //
  //     }
  //   }
  // }

  void verifyCode(context, SignUpModel model, OtpScreenEnum screenChek) async {
    if (code.length != 4) {
      AppToast.showToast('Please enter OTP', AppColors.redColor);
    } else {
      if (timeRemaining == 0) {
        AppToast.showToast('Otp timedout', AppColors.redColor);
      } else {
        loading = true;
        notifyListeners();
        if (screenChek == OtpScreenEnum.forgotOtpScreen) {
          await OtpService().verifyOtp(model.email, code).then((value) {
            if (value != null) {
              final args = NewPasswordScreenArguementsModel(model: model);
              Navigator.of(context)
                  .pushReplacementNamed(RouteNames.newPasswordPage,
                      arguments: args)
                  .then((value) {
                loading = false;
                notifyListeners();
              });
            } else {
              null;
              loading = false;
              notifyListeners();
            }
          });
        } else if (screenChek == OtpScreenEnum.signUpOtpScreen) {
          await OtpService().verifyOtp(model.email, code).then((value) async {
            if (value != null) {
              await SignUpService().signUp(model, context).then((value) async {
                if (value != null) {
                  log(value.accessToken.toString());
                  log(value.refreshToken.toString());
                  await storage.write(key: 'token', value: value.accessToken);
                  await storage.write(
                      key: 'refreshToken', value: value.refreshToken);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteNames.homePage, (route) => false);
                  loading = false;
                  notifyListeners();
                } else {
                  log('signup response null');
                  loading = false;
                  notifyListeners();
                }
              });
            } else {
              null;
              loading = false;
              notifyListeners();
            }
          });
        }
      }
    }
  }

  void changeTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (timeRemaining != 0) {
          timeRemaining--;
          notifyListeners();
        } else {
          enableResend = true;
          notifyListeners();
        }
      },
    );
  }
}
