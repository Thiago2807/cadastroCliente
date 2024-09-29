import 'package:cadastrocliente_ui/features/splash/splash_view.dart';
import 'package:flutter/material.dart';

import '../../features/login/login_view.dart';
import 'list_routes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ListRoutes.login: (_) => const LoginView(),
  ListRoutes.splash: (_) => const SplashView(),
};