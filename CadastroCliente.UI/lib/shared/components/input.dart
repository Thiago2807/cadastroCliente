import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
    required this.editController,
    required this.hintText,
    required this.obscureText,
  });

  final TextEditingController editController;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * .02),
      padding: EdgeInsets.symmetric(horizontal: size.height * .02),
      decoration: BoxDecoration(
          color: const Color(0XFFF5F5F5),
          borderRadius: BorderRadius.circular(size.width * .02)),
      child: TextFormField(
        controller: editController,
        cursorColor: Colors.grey.shade600,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.inter(
            color: Colors.grey.shade500,
          ),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
