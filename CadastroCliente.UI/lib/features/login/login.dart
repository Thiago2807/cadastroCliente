import 'dart:convert';

import 'package:cadastrocliente_ui/domain/entities/error_entity.dart';
import 'package:cadastrocliente_ui/domain/routes/list_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/data_features.dart';
import '../../data/http_config.dart';
import '../../domain/colors.dart';
import 'login_dto.dart';

class Login {
  static Future requestLogin(BuildContext context,
      {required LoginDto data}) async {
    try {
      final Dio dio = await HttpConfig.config(context);

      var response = await dio.post(
        "/api/v1/pessoa/login",
        data: data.toJson(),
      );

      if (response.statusCode != 200) {
        final errorDetails = ErrorEntity.fromJson(response.data);

        throw Exception(errorDetails.detail);
      }

      await DataFeatures.insert(
          strObject: jsonEncode(response.data),
          key: DataFeatures.keyDataClient);

      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, ListRoutes.splash, (route) => false);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            showCloseIcon: true,
            backgroundColor: Color(AppColors.red),
            content: Text(e.toString().replaceAll("Exception: ", "")),
          ),
        );
      }
    }
  }
}
