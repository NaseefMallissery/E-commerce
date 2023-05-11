import 'dart:developer';

import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/routes/route_names.dart';
import 'package:e_commerce/helper/utils/app_toast.dart';
import 'package:e_commerce/screens/wish_list/controller/services/wish_list_service.dart';
import 'package:e_commerce/screens/wish_list/model/wish_list_model.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider with ChangeNotifier {
  WishListProvider() {
    getWishListItems();
  }
  bool loading = false;
  WishListModel? wishList;
  List favouriteProducts = [];

  void toCartScreen(context) {
    Navigator.of(context).pushNamed(RouteNames.cartPage);
  }

  void getWishListItems() async {
    loading = true;
    notifyListeners();
    await WishListService().getWishListItems().then(
      (value) {
        
        if (value != null) {
          log('hy');
          wishList = value;
          notifyListeners();
          favouriteProducts =
              wishList!.products.map((e) => e.product.id).toList();
          notifyListeners();
          loading = false;
          notifyListeners();
        } else {
          loading = false;
          notifyListeners();
        }
      },
    );
  }

  void addOrRemoveFromWishList(String productId) async {
    loading = true;
    notifyListeners();
    await WishListService().addOrRemoveFromWishList(productId).then(
      (value) {
        if (value != null) {
          WishListService().getWishListItems().then(
            (value) {
              if (value != null) {
                wishList = value;
                notifyListeners();
                getWishListItems();
                loading = false;
                notifyListeners();
              } else {
                loading = false;
                notifyListeners();
              }
            },
          );
          if (value == 201) {
            AppToast.showToast('Item added to Wishlist', AppColors.greenColor);
          } else if (value == 204) {
            AppToast.showToast(
                'Item removed from Wishlist', AppColors.redColor);
          }
        } else {
          loading = false;
          notifyListeners();
        }
      },
    );
  }
}
