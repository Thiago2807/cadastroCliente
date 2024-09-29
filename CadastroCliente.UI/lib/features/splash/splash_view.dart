import 'package:cadastrocliente_ui/domain/colors.dart';
import 'package:cadastrocliente_ui/features/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Splash.verifyConfig(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradientApp,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -size.height * .1,
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
              bottom: -size.height * .08,
              right: -size.height * .09,
              child: Opacity(
                opacity: .1,
                child: CircleAvatar(
                  radius: size.width * .25,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: -size.height * .1,
              left: -size.height * .05,
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
              left: -size.height * .09,
              child: Opacity(
                opacity: .1,
                child: CircleAvatar(
                  radius: size.width * .25,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Carregando informações",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      color: Colors.white, fontSize: size.width * .05),
                ),
                SizedBox(height: size.height * .05),
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
