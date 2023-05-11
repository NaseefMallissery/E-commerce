import 'package:e_commerce/helper/constants/constants.dart';
import 'package:flutter/material.dart';

class ProductTextdesciptionStyle extends StatelessWidget {
  const ProductTextdesciptionStyle({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    this.fontsize = 14,
  });
  final String text1;
  final String text2;
  final String text3;
  final double fontsize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(
            color: Colors.grey,
            decoration: TextDecoration.lineThrough,
            overflow: TextOverflow.ellipsis,
            fontSize: fontsize,
            letterSpacing: 0.5
          ),
        ),
      kWidth5 ,
        Expanded(
          child: Text(
            text2,
            style: TextStyle(
              color: AppColors.blackColor,
              overflow: TextOverflow.ellipsis,
              fontSize: fontsize,
               letterSpacing: 0.5
            ),
          ),
        ),
kheight5,
        Expanded(
          child: Text(
            text3,
            style: TextStyle(
              color: AppColors.greenColor,
              overflow: TextOverflow.ellipsis,
              fontSize: fontsize,
               letterSpacing: 0.5
            ),
          ),
        ),
      ],
    );
  }
}
