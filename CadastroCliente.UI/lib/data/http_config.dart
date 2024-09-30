import 'dart:convert';

import 'package:cadastrocliente_ui/domain/routes/list_routes.dart';
import 'package:cadastrocliente_ui/features/login/dtos/user_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'data_features.dart';

class HttpConfig {
  static Future<Dio> config(BuildContext context) async {
    Map<String, String> headers = {};

    final result = await DataFeatures.get(key: DataFeatures.keyDataClient);

    if (result != null) {
      final dataUser = UserDto.fromJson(jsonDecode(result));

      headers = {
        'Authorization': 'Bearer ${dataUser.token}',
      };
    }

    final Dio dio = Dio(
      BaseOptions(
        baseUrl:
            "https://4486-2804-7f0-a218-1ea8-55e4-ead5-a086-54bd.ngrok-free.app",
        validateStatus: (status) {
          if (status == 401) {
            DataFeatures.delete(key: DataFeatures.keyDataClient);
            Navigator.pushNamedAndRemoveUntil(
              context,
              ListRoutes.splash,
              (route) => false,
            );
          }

          return status != null;
        },
        headers: headers,
      ),
    );

    return dio;
  }
}
