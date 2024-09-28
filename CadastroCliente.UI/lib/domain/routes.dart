import 'package:flutter/material.dart';

import '../features/login/login_view.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "/Login": (_) => const LoginView()
};