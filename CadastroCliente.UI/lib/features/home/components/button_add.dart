import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/colors.dart';

class ButtonAdd extends StatelessWidget {
  const ButtonAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: size.height * .02,
        horizontal: size.width * .05,
      ),
      decoration: BoxDecoration(
        gradient: AppColors.gradientApp,
        borderRadius: BorderRadius.circular(size.width * .02),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Adicione um Novo Usuário",
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: constraints.maxWidth * .055,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "Sem usuários cadastrados ainda? Cadastre novos membros!",
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: constraints.maxWidth * .04,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
