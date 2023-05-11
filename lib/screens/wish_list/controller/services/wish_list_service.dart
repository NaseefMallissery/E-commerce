import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/helper/constants/api_endpoints.dart';
import 'package:e_commerce/helper/constants/apiurl.dart';
import 'package:e_commerce/helper/utils/app_exceptioins.dart';
import 'package:e_commerce/helper/utils/interceptors/interceptors.dart';
import 'package:e_commerce/screens/wish_list/model/wish_list_model.dart';

class WishListService {
  Future<WishListModel?> getWishListItems() async {
    final dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get(ApiUrl.apiUrl + ApiEndPoints.wishList);
      if (response.statusCode == 200) {
        log("ytfr${response.data.toString()}");
        final WishListModel model = WishListModel.fromJson(response.data);
        return model;
      } else {
        log('null aaahn');
        return null;
      }
    } catch (e) {
      log(e.toString());
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<int?> addOrRemoveFromWishList(String productId) async {
    final dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.post(
        ApiUrl.apiUrl + ApiEndPoints.wishList,
        data: {'product': productId},
      );

      if (response.statusCode == 201) {
        return response.statusCode;
      } else if (response.statusCode == 204) {
        return response.statusCode;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }

    return null;
  }
}
