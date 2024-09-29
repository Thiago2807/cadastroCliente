import 'package:cadastrocliente_ui/domain/routes/list_routes.dart';
import 'package:cadastrocliente_ui/domain/routes/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ListRoutes.login,
      routes: routes,
    );
  }
}
