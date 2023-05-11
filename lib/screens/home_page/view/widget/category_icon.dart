import 'package:e_commerce/helper/constants/constants.dart';
import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    super.key,
    required this.imagePath,
    required this.text,
    required this.ontap,
  });

  final String imagePath;
  final String text;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.dullWhitecolor,
            backgroundImage: NetworkImage(imagePath),
            // child: Center(
            //   child: Image(
            //     fit: BoxFit.contain,
            //     height: 60,
            //     width: 60,
            //     image: NetworkImage(imagePath),
            //   ),
            // ),
          ),
          kheight5,
          Text(text),
        ],
      ),
    );
  }
}
