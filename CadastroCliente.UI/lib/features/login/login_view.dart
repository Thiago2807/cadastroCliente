import 'package:cadastrocliente_ui/domain/colors.dart';
import 'package:cadastrocliente_ui/features/login/login.dart';
import 'package:cadastrocliente_ui/features/login/login_dto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/components/input.dart';
import '../../shared/form_validation.dart';
import 'components/button_login.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  List<Map<String, dynamic>> dataForm = [];
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusPassword = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    dataForm = [
      {
        'hintText': "E-mail",
        'obscureText': false,
        'focusNode': _focusEmail,
        'editController': _emailController,
        'onFieldSubmitted': (_) {
          _focusEmail.unfocus();
          FocusScope.of(context).requestFocus(_focusPassword);
        },
        'validator': (value) => FormValidation.emailValidator(value),
      },
      {
        'hintText': "Senha",
        'obscureText': true,
        'focusNode': _focusPassword,
        'editController': _passwordController,
        'onFieldSubmitted': (_) => {},
        'validator': (value) => FormValidation.passwordValidator(value)
      }
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Container(
      decoration: BoxDecoration(
        color: Color(AppColors.primary),
        gradient: AppColors.gradientApp,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              top: -size.height * .1,
              right: -size.height * .05,
              child: Opacity(
                opacity: .1,
                child: CircleAvatar(
                  radius: size.width * .25,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: -size.height * .08,
              right: -size.height * .09,
              child: Opacity(
                opacity: .1,
                child: CircleAvatar(
                  radius: size.width * .25,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: size.height * .09),
                  ),
                  Container(
                    height: size.height * .82,
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * .1,
                      vertical: size.height * .08,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(size.width * .05),
                          topRight: Radius.circular(size.width * .05),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Container(
                        //   margin: EdgeInsets.symmetric(
                        //     horizontal: size.width * .17,
                        //     vertical: size.height * .05,
                        //   ),
                        //   child: ClipOval(
                        //     child: Image.asset(
                        //       "assets/images/login_image.jpg",
                        //       height: size.height * .2,
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                        Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: Color(AppColors.black),
                            fontSize: size.width * .08,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Faça login na sua conta primeiro",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: Color(AppColors.black),
                            fontSize: size.width * .04,
                          ),
                        ),
                        SizedBox(height: size.height * .04),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: size.height * .23,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: dataForm.length,
                                  itemBuilder: (context, index) => InputForm(
                                    hintText: dataForm[index]["hintText"],
                                    obscureText: dataForm[index]["obscureText"],
                                    editController: dataForm[index]
                                        ["editController"],
                                    focusNode: dataForm[index]["focusNode"],
                                    onFieldSubmitted: dataForm[index]
                                        ["onFieldSubmitted"],
                                    validator: dataForm[index]["validator"],
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * .03),
                              Text(
                                "Esqueceu sua senha?",
                                textAlign: TextAlign.right,
                                style: GoogleFonts.inter(
                                  color: Color(AppColors.blue),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ButtonLogin(
                                function: () {
                                  if (_formKey.currentState!.validate()) {
                                    Login.requestLogin(
                                      context,
                                      data: LoginDto.fromTextController(
                                        _emailController,
                                        _passwordController,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
