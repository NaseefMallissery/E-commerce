import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/utils/loading_widget.dart';
import 'package:e_commerce/screens/otp/controller/provider/otp_page_provider.dart';
import 'package:e_commerce/screens/otp/model/otp_enum.dart';
import 'package:e_commerce/screens/sing_up_page/controller/provider/signup_provider.dart';
import 'package:e_commerce/screens/sing_up_page/model/signup_model.dart';
import 'package:e_commerce/screens/widget/top_icon_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({
    super.key,
    required this.model,
    required this.screenCheck,
  });

  final SignUpModel model;
  final OtpScreenEnum screenCheck;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late SignUpProvider signUpProvider;
  late OtpProvider otpProvider;

  @override
  void initState() {
    otpProvider = Provider.of<OtpProvider>(context, listen: false);
    otpProvider.changeTimer();
    otpProvider.timeRemaining = 59;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.3,
                  child: const TopIconTextWidget(
                    headText: 'Otp verification',
                    subText: 'Enter the otp',
                  ),
                ),
                Column(
                  children: [
                    Consumer<OtpProvider>(
                      builder: (context, value, child) {
                        return OtpTextField(
                          numberOfFields: 4,
                          showFieldAsBox: true,
                          fillColor: AppColors.dullWhitecolor,
                          filled: true,
                          fieldWidth: 70,
                          clearText: value.clear,
                          onSubmit: (String code) => value.setCode(code),
                          // autoFocus: true,
                        );
                      },
                    ),
                    kheight20,
                    Consumer<OtpProvider>(
                      builder: (context, value, child) {
                        return value.timeRemaining != 0
                            ? Text(
                                'Resend OTP in ${value.timeRemaining}s',
                                style: fontStyleB12,
                              )
                            : TextButton(
                                onPressed: () => value.setResendVisibility(
                                    true, context, widget.model.email!),
                                child: const Text(
                                  'Resend otp',
                                  style: fontStyleB12,
                                ),
                              );
                      },
                    ),
                    kheight20,
                    Consumer<OtpProvider>(
                      builder: (context, value, child) {
                        return value.loading == true
                            ? const LoadingWidget()
                            : SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () => value.verifyCode(
                                    context,
                                    widget.model,
                                    widget.screenCheck,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.themeColor),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                    child: Text(
                                      'Submit',
                                      style: fontStyleB14,
                                    ),
                                  ),
                                ),
                              );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    otpProvider.timer?.cancel();
    super.dispose();
  }
}
