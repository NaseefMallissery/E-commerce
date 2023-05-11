import 'package:e_commerce/helper/routes/route_names.dart';
import 'package:flutter/cupertino.dart';

homePageNavigator(context, GlobalKey<FormState> currentState) {
  if (currentState.currentState!.validate()) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.homePage, (route) => false);
  }
}

signInNavigator(context) {
  Navigator.of(context)
      .pushNamedAndRemoveUntil(RouteNames.signInpage, (route) => false);
}

signupNavigator(context) {
  Navigator.of(context).pushNamed(RouteNames.signUpPage);
}

favoritePageNavigator(context) {
  Navigator.of(context).pushNamed(RouteNames.favoritePage);
}

popNavigator(context) {
  Navigator.of(context).pop();
}

profilePageNavigator(context) {
  Navigator.of(context).pushNamed(RouteNames.profile);
}

productViewPageNavigator(context) {
  Navigator.of(context).pushNamed(RouteNames.productViewPage);
}

cartPageNavigator(context) {
  Navigator.of(context).pushNamed(RouteNames.cartPage);
}

wishListNavigator(context){
  Navigator.of(context).pushNamed(RouteNames.favoritePage);
}
