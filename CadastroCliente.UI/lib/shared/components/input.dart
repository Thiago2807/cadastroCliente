import 'package:cadastrocliente_ui/features/login/store/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
    final LoginStore state = Provider.of<LoginStore>(context);
    final Size size = MediaQuery.sizeOf(context);
    return Observer(
      builder: (context) {
        IconData iconEye = Icons.visibility_rounded;

        if (obscureText) {
          if (state.visiblePassword) {
            iconEye = Icons.visibility_rounded;
          } else {
            iconEye = Icons.visibility_off_rounded;
          }
        }

        return Container(
          margin: EdgeInsets.symmetric(vertical: size.height * .02),
          padding: EdgeInsets.symmetric(horizontal: size.height * .02),
          decoration: BoxDecoration(
            color: const Color(0XFFF5F5F5),
            borderRadius: BorderRadius.circular(size.width * .02),
          ),
          child: TextFormField(
            controller: editController,
            cursorColor: Colors.grey.shade600,
            obscureText: obscureText ? state.visiblePassword : false,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.inter(
                color: Colors.grey.shade500,
              ),
              suffixIcon: obscureText
                  ? GestureDetector(
                      onTap: () => state.alterVisiblePassword(),
                      child: Icon(iconEye),
                    )
                  : null,
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        );
      },
    );
  }
}
