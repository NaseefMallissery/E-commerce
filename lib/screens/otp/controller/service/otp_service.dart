import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce/helper/constants/api_endpoints.dart';
import 'package:e_commerce/helper/constants/api_parameters.dart';
import 'package:e_commerce/helper/constants/apiurl.dart';
import 'package:e_commerce/helper/utils/app_exceptioins.dart';

class OtpService {
  final dio = Dio();
  // Future<String?> verifyOtp(otpNumber,email  ) async {
  //   log('verifyOtp this is mail:$email');
  //   log(otpNumber.toString());
  //   log('Entered verifyOtp');
  //   try {
  //     Response response = await dio.post(
  //       ApiUrl.apiUrl + ApiEndPoints.verifyOrSendOtp,
  //       data: {
  //         'otp': otpNumber,
  //         'email': email,
  //       },
  //     );
  //     log('verifyOtp otp response${response.toString()}');
  //     // queryParameters: ApiQueryParameter.queryParameter);
  //     if (response.statusCode! >= 200 && response.statusCode! <= 299) {
  //        log('verifyOtp otp status ${response.statusCode.toString()}');
  //        log("varifyOtp ${response.data['message']}");
  //       return response.data['message'];
  //     }
  //   } catch (e) {
  //     log('entered verifyOtp catch');
  //     AppExceptions.errorHandler(e);
  //   }
  //   return null;
  // }

  Future<String?> verifyOtp(email, otpNumber) async {
    try {
      Response response =
          await dio.post(ApiUrl.apiUrl + ApiEndPoints.verifyOrSendOtp,
              data: {
                'otp': otpNumber,
                'email': email,
              },
              queryParameters: ApiQueryParameter.queryParameter);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data['status'];
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

Future<String?> sendOtp(email) async {
    log(email);
    try {
      log('entered to send otp');
      Response response = await dio.get(
        ApiUrl.apiUrl + ApiEndPoints.verifyOrSendOtp,
        queryParameters: {
          'email': email,
        },
      );
      log(response.statusCode.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('otp send ');
        log(response.data.toString());
        return response.data['message'];
      }
    } catch (e) {
      log('entered catch');
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
