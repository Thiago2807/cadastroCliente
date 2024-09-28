import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/components/input.dart';
import 'components/button_login.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * .1,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: size.width * .17,
                    vertical: size.height * .05,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/login_image.jpg",
                      height: size.height * .2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF1c1c1c),
                    fontSize: size.width * .08,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Faça login na sua conta primeiro",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF1c1c1c),
                    fontSize: size.width * .04,
                  ),
                ),
                SizedBox(height: size.height * .04),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InputForm(
                        hintText: "E-mail",
                        obscureText: false,
                        editController: _emailController,
                      ),
                      InputForm(
                        hintText: "Senha",
                        obscureText: true,
                        editController: _passwordController,
                      ),
                      SizedBox(height: size.height * .03),
                      Text(
                        "Esqueceu sua senha?",
                        textAlign: TextAlign.right,
                        style: GoogleFonts.inter(
                          color: const Color(0xFF2B87FD),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const ButtonLogin()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
