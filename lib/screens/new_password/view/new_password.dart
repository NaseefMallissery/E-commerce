import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/utils/loading_widget.dart';
import 'package:e_commerce/screens/new_password/controller/new_password_provider.dart';
import 'package:e_commerce/screens/sing_up_page/model/signup_model.dart';
import 'package:e_commerce/screens/widget/input_field.dart';
import 'package:e_commerce/screens/widget/top_icon_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewPasswordPage extends StatelessWidget {
  NewPasswordPage({
    super.key,
    required this.model,
  });
  final SignUpModel model;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewPasswordProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                    child: TopIconTextWidget(
                      headText: "Create a new password",
                      subText: "Enter your password currectly",
                    ),
                  ),
                ),
              ),
              kheight20,
              kheight30,
              Consumer<NewPasswordProvider>(
                builder: (context, value, child) {
                  return CustomInputField(
                    hintText: 'New Password',
                    iconData: Icons.lock_outline,
                    controller: provider.newPasswordcontroller,
                    validator: (value) => provider.passwordValidation(value),
                    autoFocus: true,
                    obscureText: value.passwordHidden,
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
              kheight15,
              CustomInputField(
                  hintText: 'Confirm Password',
                  iconData: Icons.lock_outline,
                  controller: provider.confirmPasswordContriller,
                  validator: (value) =>
                      provider.confirmPasswordValidation(value),
                  autoFocus: false,
                  obscureText: true),
              kheight30,
              Consumer<NewPasswordProvider>(
                builder: (context, value, child) {
                  return value.loading == true
                      ? const LoadingWidget()
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.themeColor),
                            onPressed: () => value.success(
                              model.email,
                              context,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text('Continue'),
                            ),
                          ),
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
