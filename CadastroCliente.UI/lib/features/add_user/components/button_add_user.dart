import 'package:cadastrocliente_ui/domain/routes/list_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/colors.dart';

class ButtonAddUser extends StatelessWidget {
  const ButtonAddUser({
    super.key,
    required this.function,
    required this.content,
    required this.isLoading,
  });

  final Function() function;
  final Widget content;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: function,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: size.height * .02,
          horizontal: size.width * .05,
        ),
        decoration: BoxDecoration(
          gradient: AppColors.gradientApp,
          borderRadius: BorderRadius.circular(size.width * .02),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) => isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [content],
                ),
        ),
      ),
    );
  }
}
