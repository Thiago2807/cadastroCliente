import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/colors.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    super.key,
    required this.function,
    required this.isLoading,
  });

  final Function() function;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: function,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.height * .03),
        padding: EdgeInsets.symmetric(vertical: size.height * .015),
        decoration: BoxDecoration(
          gradient: AppColors.gradientApp,
          borderRadius: BorderRadius.circular(size.width * .02),
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1,
                ),
              )
            : Text(
                "Entrar",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
