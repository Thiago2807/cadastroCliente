import 'package:cadastrocliente_ui/features/login/store/login_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'domain/myapp.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<LoginStore>(
          create: (_) => LoginStore(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
