import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:e_commerce/helper/constants/api_endpoints.dart';
import 'package:e_commerce/helper/constants/apiurl.dart';
import 'package:e_commerce/helper/utils/app_exceptioins.dart';
import 'package:e_commerce/screens/sing_up_page/model/signup_token_model.dart';
import 'package:e_commerce/screens/sing_up_page/model/signup_model.dart';

class SignUpService {
  final dio = Dio();
  Future<SignUpTokenModel?> signUp(SignUpModel model, context) async {
    try {
      Response response = await dio.post(ApiUrl.apiUrl + ApiEndPoints.signUp,
          data: jsonEncode(model.toJson()),
          queryParameters: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final SignUpTokenModel model = SignUpTokenModel.fromJson(response.data);
        return model;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
