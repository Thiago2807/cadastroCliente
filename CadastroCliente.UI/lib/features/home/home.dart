import 'dart:convert';

import 'package:cadastrocliente_ui/domain/entities/user_entity.dart';
import 'package:cadastrocliente_ui/domain/routes/list_routes.dart';
import 'package:flutter/cupertino.dart';

import '../../data/data_features.dart';

class Home {
  static Future<UserEntity> getDataUser() async {
    final strDataUser = await DataFeatures.get(key: DataFeatures.keyDataClient);

    final dataUser = UserEntity.fromJson(jsonDecode(strDataUser!));

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
}
