import 'dart:developer';

import 'package:e_commerce/helper/routes/route_names.dart';
import 'package:e_commerce/screens/home_page/controller/services/home_page_service.dart';
import 'package:e_commerce/screens/home_page/model/category_model.dart';
import 'package:e_commerce/screens/home_page/model/home_carousal_model.dart';
import 'package:e_commerce/screens/home_page/model/products_model.dart';
import 'package:e_commerce/screens/home_page/view/widget/product_collection.dart';
import 'package:e_commerce/screens/product_view/model/product_view_model.dart';
import 'package:flutter/cupertino.dart';

class HomePageProvider with ChangeNotifier {
  HomePageProvider() {
    callFunctions();
  }

  final TextEditingController controller = TextEditingController();
  List<HomeCarousalModel> carousalList = [];
  List<CategoryModel> categoryList = [];
  List<ProductsModel> productsList = [];
  bool loading = false;

  void callFunctions() {
    getCarousel();
    getCategories();
    getAllProducts();
  }

  void getCarousel() async {
    loading = true;
    notifyListeners();
    await HomeService().carousalGet().then((value) {
      if (value != null) {
        log('notnull');
        carousalList = value;
        loading = false;
        notifyListeners();
      } else {
        log('null');
        loading = false;
        notifyListeners();
        // null;
      }
    });
  }

  void getCategories() async {
    loading = true;
    notifyListeners();
    await HomeService().getCategory().then((value) {
      if (value != null) {
        log('get categorys not null');
        categoryList = value;
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

  void getAllProducts() async {
    log('getAllProducrts');
    loading = true;
    notifyListeners();
    await HomeService().getAllProducts().then((value) {
      log(value.toString());
      if (value != null) {
        // log('products value not null');
        productsList = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        log("get all products else");
        loading = false;
        notifyListeners();
        null;
      }
    });
  }

  void toProductScreen(context, productId) {
    final args = ProductIdModel(productId: productId);

    Navigator.of(context).pushNamed(
      RouteNames.productViewPage,
      arguments: args,
    );
  }

  void toCollectionScreen(
      BuildContext context, String category, String categoryId) {
    productsList.clear();
    notifyListeners();
    final args =
        ProductCollectionScreen(category: category, categoryId: categoryId);
    Navigator.of(context)
        .pushNamed(
      RouteNames.productCollections,
      arguments: args,
    )
        .then((value) {
      getProducts();
    });
    notifyListeners();
  }
   void getProducts() async {
    loading = true;
    notifyListeners();
    await HomeService().getAllProducts().then((value) {
      if (value != null) {
        productsList = value;
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

  void getProductsByCategory(String idCategory) async {
    loading = true;
    notifyListeners();
    await HomeService().getProductsByCategory(idCategory).then((value) {
      if (value != null) {
        productsList = value;
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
