import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/utils/loading_widget.dart';
import 'package:e_commerce/screens/forget_password/controller/provider/forgot_password_provider.dart';
import 'package:e_commerce/screens/widget/input_field.dart';
import 'package:e_commerce/screens/widget/top_icon_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final forgotPasswordProvider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              reverse: true,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Center(
                          child: TopIconTextWidget(
                            headText: "Forgot your password?",
                            subText: "Enter your E-mail",
                          ),
                        ),
                      ),
                    ),
                    kheight20,
                    kheight30,
                    CustomInputField(
                      autoFocus: true,
                      controller: forgotPasswordProvider.findAccountController,
                      keyBoardType: TextInputType.emailAddress,
                      // action: TextInputAction.done,
                      iconData: Icons.mail,
                      hintText: 'Email',
                      obscureText: false,
                      validator: (value) => forgotPasswordProvider
                          .findAccountTextfieldValidation(value),
                    ),
                    kheight30,
                    Consumer<ForgotPasswordProvider>(
                        builder: (context, values, _) {
                      return values.loading == true
                          ? const LoadingWidget()
                          : SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.themeColor),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text('Continue'),
                                ),
                                onPressed: () => values.toOtpScreen(
                                  context,
                                  formKey.currentState!,
                                ),
                              ),
                            );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
