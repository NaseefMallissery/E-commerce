import 'package:e_commerce/helper/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginWithButton extends StatelessWidget {
  const LoginWithButton({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.labelText,
  }) : super(key: key);
  final IconData icon;
  final Color iconColor;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: FaIcon(
          icon,
          color: iconColor,
        ),
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            labelText,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.greyColor,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
        ),
      ),
    );
  }
}
