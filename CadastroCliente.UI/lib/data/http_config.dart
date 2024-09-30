import 'dart:convert';

import 'package:cadastrocliente_ui/features/login/dtos/user_dto.dart';
import 'package:dio/dio.dart';

import 'data_features.dart';

class HttpConfig {
  static Future<Dio> config() async {
    Map<String, String> headers = {};

    final result = await DataFeatures.get(key: DataFeatures.keyDataClient);

    if (result != null) {
      final dataUser = UserDto.fromJson(jsonDecode(result!));

      headers = {
        'Authorization': 'Bearer ${dataUser.token}',
      };
    }

    final Dio dio = Dio(
      BaseOptions(
        baseUrl:
            "https://4486-2804-7f0-a218-1ea8-55e4-ead5-a086-54bd.ngrok-free.app",
        validateStatus: (status) => status != null,
        headers: headers,
      ),
    );

    return dio;
  }
}
