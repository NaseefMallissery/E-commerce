
import 'package:e_commerce/helper/routes/route_names.dart';
import 'package:e_commerce/screens/home_page/controller/services/home_page_service.dart';
import 'package:e_commerce/screens/home_page/model/products_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  ProductProvider() {
    loadingStart();
  }

  bool loading = false;
  ProductsModel? product;
  int? sizeChartIndex=0;
  String? productId;
  String? productSize;

  void loadingStart() {
    loading = true;
    notifyListeners();
  }

  void sizeSelect(int index) {
    sizeChartIndex = index;
    notifyListeners();
    productSize = product!.size![index].toString();
    notifyListeners();
  }

  void goToCart(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.cartPage);
  }

   void getOneProduct(String productId) async {
    loading = true;
    notifyListeners();
    await HomeService().getAProduct(productId).then((value) {
      if (value != null) {
        sizeChartIndex = null;
        notifyListeners();
        product = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
        null;
      }
    });
  }

}
