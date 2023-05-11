import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/helper/constants/api_endpoints.dart';
import 'package:e_commerce/helper/constants/api_parameters.dart';
import 'package:e_commerce/helper/constants/apiurl.dart';
import 'package:e_commerce/helper/utils/app_exceptioins.dart';
import 'package:e_commerce/screens/sing_up_page/model/signup_model.dart';

class ForgotPasswordService {
  final dio = Dio();
  Future<SignUpModel?> getUser(String email) async {
    log('getUser');
    log(email.toString());

    try {
      Response response = await dio.get(
        ApiUrl.apiUrl + ApiEndPoints.usercheck,
        queryParameters: {
          'email': email,
        },
      );
      log(email.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log('got user');
        final SignUpModel model = SignUpModel.fromJson(response.data!);
        return model;
      } else if (response.statusCode == 201) {
        log('No user found');
        return null;
      }
    } catch (e) {
      log('entered catch');
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> changePassword(email, newPassword) async {
    try {
      log('entered changepassword function');
      Response<dynamic> response = await dio.post(
        ApiUrl.apiUrl + ApiEndPoints.forgetPassword,
        data: {
          'email': email,
          'password': newPassword,
        },
        queryParameters: ApiQueryParameter.queryParameter,
      );
      log(response.statusCode.toString());
      if (response.statusCode == 202) {
        log('Password changed successfull');
        return response.data['message'];
      }
    } catch (e) {
      log('entered catch');
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
