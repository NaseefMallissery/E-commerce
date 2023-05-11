import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/navigators/navigators.dart';
import 'package:flutter/material.dart';

PreferredSize customAppBarWidget(
  BuildContext context,
  String title,
) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: AppBar(
        backgroundColor: AppColors.whiteColor,
        // elevation: 0,
        leading: IconButton(
          onPressed: () {
            popNavigator(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.iconColor,
          ),
        ),
        title: Text(
          title,
          style: appBarFont,
        ),
        actions: const [],
      ),
    ),
  );
}
