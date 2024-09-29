import 'package:cadastrocliente_ui/features/login/store/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class InputForm extends StatefulWidget {
  const InputForm({
    super.key,
    required this.editController,
    required this.hintText,
    required this.obscureText,
    required this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.enable = true,
    this.mask = "",
    this.textInputType = TextInputType.text,
  });

  final TextEditingController editController;
  final String hintText;
  final bool obscureText;
  final FocusNode focusNode;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool enable;
  final String mask;
  final TextInputType textInputType;

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  MaskTextInputFormatter maskFormatter = MaskTextInputFormatter();

  @override
  void initState() {
    maskFormatter = MaskTextInputFormatter(
      mask: widget.mask ?? "",
      //filter: {"#": widget.regExp ?? RegExp(r'[A-Za-z0-9]')},
      type: MaskAutoCompletionType.eager,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LoginStore state = Provider.of<LoginStore>(context);
    final Size size = MediaQuery.sizeOf(context);
    return Observer(
      builder: (context) {
        IconData iconEye = Icons.visibility_rounded;

        if (widget.obscureText) {
          if (state.visiblePassword) {
            iconEye = Icons.visibility_rounded;
          } else {
            iconEye = Icons.visibility_off_rounded;
          }
        }

        return Container(
          margin: EdgeInsets.symmetric(vertical: size.height * .01),
          padding: EdgeInsets.symmetric(horizontal: size.height * .02),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(size.width * .02),
          ),
          child: TextFormField(
            enabled: widget.enable,
            onChanged: widget.onChanged,
            focusNode: widget.focusNode,
            controller: widget.editController,
            cursorColor: Colors.grey.shade600,
            inputFormatters: [maskFormatter],
            keyboardType: widget.textInputType,
            obscureText: widget.obscureText ? state.visiblePassword : false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: widget.obscureText ? size.height * .014 : 0),
              hintText: widget.hintText,
              hintStyle: GoogleFonts.inter(
                color: Colors.grey.shade500,
              ),
              suffixIcon: widget.obscureText
                  ? GestureDetector(
                      onTap: () => state.alterVisiblePassword(),
                      child: Icon(
                        iconEye,
                      ),
                    )
                  : null,
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
            onFieldSubmitted: widget.onFieldSubmitted,
          ),
        );
      },
    );
  }
}
