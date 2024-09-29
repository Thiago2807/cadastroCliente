import 'package:flutter/material.dart';

import 'components/app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(size.width, size.height * .07),
          child: const AppBarComponent(),
        ),
      ),
    );
  }
}
