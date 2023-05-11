import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce/helper/constants/api_endpoints.dart';
import 'package:e_commerce/helper/constants/apiurl.dart';
import 'package:e_commerce/helper/utils/interceptors/interceptors.dart';
import 'package:e_commerce/helper/utils/app_exceptioins.dart';
import 'package:e_commerce/screens/home_page/model/category_model.dart';
import 'package:e_commerce/screens/home_page/model/home_carousal_model.dart';
import 'package:e_commerce/screens/home_page/model/products_model.dart';

class HomeService {
  Future<List<HomeCarousalModel>?> carousalGet() async {
  
    try {
      log('carousal try block');

        Dio dios = await Interceptorapi().getApiUser();
      final Response response =
          await dios.get(ApiUrl.apiUrl + ApiEndPoints.carousal);
          log('carousal api called');
          
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        final List<HomeCarousalModel> carousals = (response.data as List)
            .map((e) => HomeCarousalModel.fromJson(e))
            .toList();
        return carousals;
      } else {
        return null;
      }
    } catch (e) {
      log('entered catch');
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<List<CategoryModel>?> getCategory() async {
    Dio dio = await Interceptorapi().getApiUser();

    // const url = 'http://172.16.6.78:5004/api/v1/category';
    try {
      final Response response =
          await dio.get(ApiUrl.apiUrl + ApiEndPoints.category);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        final List<CategoryModel> category = (response.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        return category;
      } else {
        return null;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<List<ProductsModel>?> getAllProducts() async {
    Dio dio = await Interceptorapi().getApiUser();

    try {
      final Response response =
          await dio.get(ApiUrl.apiUrl + ApiEndPoints.products);

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        // log("all product${response.data.toString()}");
        final List<ProductsModel> products = (response.data as List)
            .map((e) => ProductsModel.fromJson(e))
            .toList();
        return products;
      } else {
        return null;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<List<ProductsModel>?> getProductsByCategory(String categoryId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios
          .get('${ApiUrl.apiUrl + ApiEndPoints.products}?category=$categoryId');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<ProductsModel> products = (response.data as List).map((e) => ProductsModel.fromJson(e)).toList();
        return products;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
    Future<ProductsModel?> getAProduct(String productId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get('${ApiUrl.apiUrl + ApiEndPoints.products}/$productId');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final ProductsModel product = ProductsModel.fromJson(response.data);
        return product;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
