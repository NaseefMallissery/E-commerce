import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/navigators/navigators.dart';
import 'package:e_commerce/helper/utils/loading_widget.dart';
import 'package:e_commerce/screens/signin_page/controller/provider/signin_provider.dart';
import 'package:e_commerce/screens/widget/input_field.dart';
import 'package:e_commerce/screens/signin_page/view/widget/button_login_with.dart';
import 'package:e_commerce/screens/signin_page/view/widget/forgot_button.dart';
import 'package:e_commerce/screens/widget/top_icon_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context, listen: false);
    // final deviceHeight = MediaQuery.of(context).size.height;
    // final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              kheight30,
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                    child: TopIconTextWidget(
                      headText: "Welcome to Shop!t",
                      subText: "Sign in to continue",
                    ),
                  ),
                ),
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        kheight10,
                        CustomInputField(
                          hintText: 'Your E-mail',
                          autoFocus: false,
                          obscureText: false,
                          iconData: Icons.mail_outline,
                          controller: signInProvider.emailController,
                          validator: (value) =>
                              signInProvider.nameValidation(value),
                        ),
                        kheight10,
                        Consumer<SignInProvider>(
                          builder: (context, value, child) {
                            return CustomInputField(
                              autoFocus: false,
                              hintText: 'Password',
                              obscureText: value.passwordHidden,
                              iconData: Icons.lock_outline,
                              controller: signInProvider.passwordController,
                              validator: (value) =>
                                  signInProvider.passwordValidation(value),
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
                            );
                          },
                        ),
                        kheight30,
                        Consumer<SignInProvider>(
                          builder: (context, value, child) {
                            return value.loading == true
                                ? const LoadingWidget()
                                : SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        value.login(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.themeColor,
                                      ),
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Center(
                                          // height: 50 ,
                                          child: Text("Sign In",
                                              style: fontStyleB14),
                                        ),
                                      ),
                                    ),
                                  );
                          },
                        ),
                        kheight10,
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 20),
                                child: const Divider(
                                  color: Colors.black,
                                  height: 10,
                                ),
                              ),
                            ),
                            const Text("OR"),
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 20, right: 10),
                                child: const Divider(
                                  color: Colors.black,
                                  height: 10,
                                ),
                              ),
                            )
                          ],
                        ),
                        kheight20,
                        const LoginWithButton(
                          icon: FontAwesomeIcons.google,
                          iconColor: Colors.red,
                          labelText: "Login with Google",
                        ),
                        kheight20,
                        const Center(
                          child: ForgotButton(
                            text1: "Forgot Password?",
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have account?",
                                style: fontStyle12b54),
                            TextButton(
                                onPressed: () {
                                  signupNavigator(context);
                                },
                                child: const Text(
                                  "sign up",
                                  style: fontStyleB12,
                                ))
                          ],
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
