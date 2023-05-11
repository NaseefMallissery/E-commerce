import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/navigators/navigators.dart';
import 'package:e_commerce/helper/utils/loading_widget.dart';
import 'package:e_commerce/screens/sing_up_page/controller/provider/signup_provider.dart';
import 'package:e_commerce/screens/widget/input_field.dart';
import 'package:e_commerce/screens/widget/top_icon_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context, listen: false);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   signUpProvider.clearControllers();
    // });

    // final deviceHeight = MediaQuery.of(context).size.height;
    // final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                    child: TopIconTextWidget(
                      headText: "Let's Get Started",
                      subText: "Create a new account",
                    ),
                  ),
                ),
                kheight30,
                // const SizedBox(
                //   height: 30,
                // ),
                SizedBox(
                  // height: deviceHeight * 0.60,
                  width: double.infinity,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            CustomInputField(
                              autoFocus: false,
                              obscureText: false,
                              iconData: Icons.person_outline_sharp,
                              hintText: "Enter your name",
                              controller: signUpProvider.nameController,
                              validator: (value) =>
                                  signUpProvider.nameValidation(value),
                            ),
                            kheight10,
                            CustomInputField(
                              autoFocus: false,
                              hintText: 'Enter your E-mail',
                              obscureText: false,
                              iconData: Icons.mail_outline_rounded,
                              controller: signUpProvider.emailController,
                              validator: (value) =>
                                  signUpProvider.emailValidation(value),
                              keyBoardType: TextInputType.emailAddress,
                            ),
                            kheight10,
                            CustomInputField(
                              hintText: 'Phone Number',
                              iconData: Icons.phone,
                              controller: signUpProvider.numberController,
                              validator: (value) =>
                                  signUpProvider.numberValidation(value),
                              autoFocus: false,
                              obscureText: false,
                              keyBoardType: TextInputType.phone,
                            ),
                            kheight10,
                            Consumer<SignUpProvider>(
                              builder: (context, value, child) =>
                                  CustomInputField(
                                autoFocus: false,
                                hintText: 'Enter password',
                                obscureText: value.passwordHidden,
                                iconData: Icons.lock_outline,
                                controller: signUpProvider.passwordController,
                                validator: (value) =>
                                    signUpProvider.passwordValidation(value),
                                suffixIcon: InkWell(
                                  onTap: value.togglePassword,
                                  child: value.passwordHidden
                                      ? const Icon(
                                          Icons.visibility,
                                          color: AppColors.greyColor,
                                        )
                                      : const Icon(
                                          Icons.visibility_off,
                                          color: AppColors.greyColor,
                                        ),
                                ),
                              ),
                            ),
                            kheight10,
                            CustomInputField(
                              autoFocus: false,
                              hintText: 'Enter your password again',
                              obscureText: true,
                              iconData: Icons.lock_outline,
                              controller:
                                  signUpProvider.confirmPasswordController,
                              validator: (value) => signUpProvider
                                  .confirmPasswordValidation(value),
                            ),
                          ],
                        ),
                        kheight30,
                        Consumer<SignUpProvider>(
                            builder: (context, value, child) {
                          return value.loading == true
                              ? const LoadingWidget()
                              : SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.themeColor),
                                    onPressed: () {
                                      value.toSignUpOtpScreen(
                                          context, formKey.currentState!);
                                    },
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      child: Text(
                                        "Sign Up",
                                        style: fontStyleB14,
                                      ),
                                    ),
                                  ),
                                );
                        }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: fontStyle12b54,
                            ),
                            TextButton(
                              onPressed: () {
                                signInNavigator(context);
                              },
                              child: const Text(
                                "Sign In",
                                style: fontStyleB12,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
