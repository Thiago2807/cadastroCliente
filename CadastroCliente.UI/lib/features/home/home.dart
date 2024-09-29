import 'dart:convert';
import 'dart:math';

import 'package:cadastrocliente_ui/features/login/dtos/user_dto.dart';
import 'package:cadastrocliente_ui/domain/routes/list_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/data_features.dart';
import '../../data/http_config.dart';
import '../../domain/colors.dart';
import '../../domain/entities/error_entity.dart';
import '../../domain/entities/user_entity.dart';

class Home {
  static Future<UserDto> getDataUser() async {
    final strDataUser = await DataFeatures.get(key: DataFeatures.keyDataClient);

    final dataUser = UserDto.fromJson(jsonDecode(strDataUser!));

    return dataUser;
  }

  static Future logout(BuildContext context) async {
    await DataFeatures.delete(key: DataFeatures.keyDataClient);

    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        ListRoutes.splash,
        (route) => false,
      );
    }
  }

  static Future<List<UserEntity>> requestListClient(BuildContext context) async {
    try {
      final Dio dio = await HttpConfig.config();

      var response = await dio.get("/api/v1/pessoa");

      if (response.statusCode != 200) {
        final errorDetails = ErrorEntity.fromJson(response.data);

        throw Exception(errorDetails.detail);
      }

      final dataList = response.data as List<dynamic>;

      final dataUsers = dataList.map((e) => UserEntity.fromJson(e)).toList();

      return dataUsers;
    } catch (e) {
      return [];
    }
  }

  static Color getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
