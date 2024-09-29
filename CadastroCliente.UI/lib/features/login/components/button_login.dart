import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/colors.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * .03),
      padding: EdgeInsets.symmetric(vertical: size.height * .015),
      decoration: BoxDecoration(
        color: Color(AppColors.primary),
        borderRadius: BorderRadius.circular(size.width * .02),
      ),
      child: Text(
        "Entrar",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
