import 'package:cadastrocliente_ui/domain/colors.dart';
import 'package:cadastrocliente_ui/features/home/components/button_add.dart';
import 'package:cadastrocliente_ui/features/home/components/list_clients.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(size.width, size.height * .07),
          child: const AppBarComponent(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * .1,
            vertical: size.height * .02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ButtonAdd(),
              SizedBox(height: size.height * .03),
              Text(
                "Veja o usuários cadastrados:",
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(
                  color: Color(AppColors.blue),
                  fontSize: size.width * .04,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: size.height * .02),
              SizedBox(
                height: size.height * .67,
                child: const ListClients(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
