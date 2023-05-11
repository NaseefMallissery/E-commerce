import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/utils/loading_widget.dart';
import 'package:e_commerce/screens/new_password/controller/new_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuccessDialouge extends StatelessWidget {
  const SuccessDialouge({super.key});
  @override
  Widget build(BuildContext context) {
    final newPasswordProvider =
        Provider.of<NewPasswordProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      newPasswordProvider.toSignInScreen(context);
    });
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.whiteColor,
          ),
          width: 300,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Success!',
                style: fontStyleB14,
              ),
              kheight15,
              Text(
                'You will be redirected to the\nHome page in a\nfew seconds',
                textAlign: TextAlign.center,
                style: fontStyle14,
              ),
              kheight20,
              LoadingWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
