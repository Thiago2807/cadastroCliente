import 'package:dio/dio.dart';

import 'data_features.dart';

class HttpConfig {
  static Future<Dio> config() async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: "https://ca3b-2804-7f0-a218-1ea8-8c9-ead3-15b5-550e.ngrok-free.app",
        validateStatus: (status) => status != null
      ),
    );
    Map<String, String> headers = {};

    final result = await DataFeatures.get(key: DataFeatures.keyDataClient);

    if (result == null) {
      headers = {
        'Authorization': 'Bearer ',
      };
    }

    return dio;
  }
}
