import 'package:e_commerce/helper/constants/constants.dart';
import 'package:flutter/cupertino.dart';

class TopIconTextWidget extends StatelessWidget {
  const TopIconTextWidget({
    Key? key,
    required this.headText,
    required this.subText,
  }) : super(key: key);

  final String headText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    // final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "asset/images/logo (2).png",
              ),
            ),
          ),
          height: 120,
          width: deviceWidth * 0.2,
        ),
        Text(
          headText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.themeColor,
            letterSpacing: 0.5,
          ),
        ),
        Text(
          subText,
          style: const TextStyle(
            color: AppColors.greyColor,
            fontSize: 12,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
