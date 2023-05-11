import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/screens/signin_page/controller/provider/signin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotButton extends StatelessWidget {
  const ForgotButton({
    Key? key,
    required this.text1,
  }) : super(key: key);
  final String text1;

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<SignInProvider>(context,listen: false);
    return TextButton(
      onPressed: () {
        provider.toForgotPasswordScreen(context);
      },
      child: Text(text1, style: fontStyleB12),
    );
  }
}
