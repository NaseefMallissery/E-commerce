import 'dart:developer';
import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/utils/app_toast.dart';
import 'package:e_commerce/screens/cart_page/controller/services/cart_service.dart';
import 'package:e_commerce/screens/cart_page/model/add_to_cart.dart';
import 'package:e_commerce/screens/cart_page/model/ger_from_cart.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {
  CartProvider() {
    getCartItems();
  }
  GetFromCartModel? cartList;
  bool loading = false;
  bool countLoading = false;
  int quantity = 1;
  List<String> cartItemsId = [];
  int? totalSave;

  void getCartItems() async {
    loading = true;
    notifyListeners();
    await CartService().getCartItems().then((value) {
      if (value != null) {
        log('getCartItems not null');
        cartList = value;

        notifyListeners();
        cartItemsId = cartList!.products.map((e) => e.product.id).toList();
        notifyListeners();
        totalSave =
            cartList!.totalDiscount.toInt() - cartList!.totalPrice.toInt();
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  void addToCart(String productId, String? productSize) async {
    if (productSize == null) {
      AppToast.showToast('Select size', AppColors.redColor);
    } else {
      final AddToCartModel model = AddToCartModel(
        productId: productId,
        quantity: quantity,
        size: productSize.toString(),
      );
      await CartService().addToCart(model).then((value) {
        if (value != null) {
          getCartItems();
          if (value == 'product added to cart successfully') {
            AppToast.showToast(
              'Product added to cart',
              AppColors.greenColor,
            );
          } else {
            null;
          }
        } else {
          null;
        }
      });
    }
  }

  void removeFromCart(String productId) async {
    loading = true;
    notifyListeners();
    await CartService().removeFromCart(productId).then((value) {
      if (value != null) {
        getCartItems();
        AppToast.showToast('Item removed from cart', AppColors.redColor);
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  void incrementOrDecrementQuantity(int qty, String productId,
      String productSize, int productquantity) async {
    log(productquantity.toString());
    final AddToCartModel model = AddToCartModel(
      productId: productId,
      quantity: qty,
      size: productSize.toString(),
    );
    if (qty == 1 && productquantity >= 1 || qty == -1 && productquantity > 1) {
      await CartService().addToCart(model).then((value) async {
        if (value != null) {
          await CartService().getCartItems().then((value) {
            if (value != null) {
              cartList = value;
              notifyListeners();
              cartItemsId =
                  cartList!.products.map((e) => e.product.id).toList();
              notifyListeners();
              totalSave = cartList!.totalDiscount.toInt() -
                  cartList!.totalPrice.toInt();
              notifyListeners();
            } else {
              null;
            }
          });
        } else {
          null;
        }
      });
    } else {
      null;
    }
  }

  // void toAddressScreen(context) {
  //   Navigator.of(context).pushNamed(RouteNames.addressScreen);
  // }
}
