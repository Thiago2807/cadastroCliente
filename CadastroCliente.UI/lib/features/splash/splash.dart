import 'package:cadastrocliente_ui/domain/routes/list_routes.dart';
import 'package:flutter/cupertino.dart';

import '../../data/data_features.dart';

class Splash {
  static Future verifyConfig(BuildContext context) async {
    final result = await DataFeatures.get(key: DataFeatures.keyDataClient);

    if (context.mounted) {
      if (result == null) {
        Navigator.pushNamedAndRemoveUntil(context, ListRoutes.login, (route) => false,);
      }
      else {
        Navigator.pushNamedAndRemoveUntil(context, ListRoutes.home, (route) => false,);
      }
    }
  }
}