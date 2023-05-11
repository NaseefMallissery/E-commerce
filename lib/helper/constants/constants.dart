import 'package:flutter/material.dart';

// colors

class AppColors {
  static const themeColor = Color.fromARGB(255, 48, 25, 52);
  static const greyColor = Colors.grey;
  static final greyColor500 = Colors.grey[500];
  static const blackColor = Colors.black87;
  static const black87Color = Colors.black87;
  static const black38Color = Colors.black38;
  static const redColor = Colors.red;
  static const whiteColor = Colors.white;
  static const dullWhitecolor = Colors.white60;
  static const iconColor = Color.fromARGB(255, 144, 152, 177);
  static const textColor = Color.fromARGB(244, 34, 50, 99);

  static const greenColor = Colors.green;
}

// const sizes

const kheight15 = SizedBox(
  height: 15,
);

const kheight10 = SizedBox(
  height: 10,
);
const kheight5 = SizedBox(
  height: 5,
);

const kheight20 = SizedBox(
  height: 20,
);

const kheight30 = SizedBox(
  height: 30,
);
const kWidth10 = SizedBox(
  width: 10,
);
const kWidth5 = SizedBox(
  width: 5,
);

// font Style

const fontStyleB14 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.5,
);
const fontStyle14 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.5,
);
const font14ThemeTextcolor = TextStyle(
  fontSize: 14,
  color: AppColors.textColor,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.5,
);
const font14Greycolor = TextStyle(
  fontSize: 14,
  color: AppColors.greyColor,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.5,
);

const fontStyleB12 = TextStyle(
  fontSize: 12,
  color: Colors.black,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.5,
);

const fontStyle12b54 = TextStyle(
  fontSize: 12,
  color: Colors.black54,
  letterSpacing: 0.5,
);

const mainFontStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: AppColors.textColor,
  letterSpacing: 0.5,
);

const categoryNameFontStyle = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.bold,
  color: AppColors.iconColor,
  letterSpacing: 0.5,
);

const productNameFont = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.bold,
  color: AppColors.textColor,
  letterSpacing: 0.5,
);
const priceWithcrossing = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.bold,
  color: AppColors.greyColor,
  letterSpacing: 0.5,
  decoration: TextDecoration.lineThrough,
);

const appBarFont = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: AppColors.textColor,
  letterSpacing: 0.5,
);
const tileTextFont = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: AppColors.textColor,
  letterSpacing: 0.5,
);

const listTileFontB12 = TextStyle(
  fontSize: 12,
  color: AppColors.textColor,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.5,
);

const productViewName = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: AppColors.textColor,
  letterSpacing: 0.5,
);
