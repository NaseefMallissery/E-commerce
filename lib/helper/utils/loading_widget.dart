import 'package:e_commerce/helper/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: AppColors. themeColor,
        size: 33,
        secondRingColor: AppColors.black87Color,
        thirdRingColor: AppColors.black87Color,
      ),
    );
  }
}
