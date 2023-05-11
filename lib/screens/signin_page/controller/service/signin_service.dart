import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/helper/constants/api_endpoints.dart';
import 'package:e_commerce/helper/constants/api_parameters.dart';
import 'package:e_commerce/helper/constants/apiurl.dart';
import 'package:e_commerce/helper/utils/app_exceptioins.dart';
import 'package:e_commerce/screens/signin_page/model/token_model.dart';
import 'package:e_commerce/screens/signin_page/model/login_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInService {
  final dio = Dio();
  Future<TokenModel?> login(LoginModel model) async {
    try {
      Response<Map<String, dynamic>> response = await dio.post(
        ApiUrl.apiUrl + ApiEndPoints.login,
        queryParameters: ApiQueryParameter.queryParameter,
        data: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        log(response.data.toString());
        final TokenModel model = TokenModel.fromJson(response.data!);
        return model;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<GoogleSignInAccount?> googleSignIn(GoogleSignIn googleSignIn) async {
    try {
      final result = await googleSignIn.signIn();
      return result;
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
