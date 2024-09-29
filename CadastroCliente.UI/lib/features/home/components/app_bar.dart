import 'package:cadastrocliente_ui/domain/colors.dart';
import 'package:cadastrocliente_ui/features/login/dtos/user_dto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home.dart';

class AppBarComponent extends StatefulWidget {
  const AppBarComponent({super.key});

  @override
  State<AppBarComponent> createState() => _AppBarComponentState();
}

class _AppBarComponentState extends State<AppBarComponent> {
  late Future<UserDto> dataUser;

  @override
  void initState() {
    dataUser = Home.getDataUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        height: constraints.maxHeight,
        padding: EdgeInsets.symmetric(
          horizontal: constraints.maxWidth * .03,
        ),
        child: FutureBuilder<UserDto>(
          future: dataUser,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container();
            }

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Olá, seja bem-vindo",
                  style: GoogleFonts.inter(
                    color: Color(AppColors.blue),
                    fontSize: constraints.maxWidth * .04,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                PopupMenuButton(
                  position: PopupMenuPosition.under,
                  color: Colors.white,
                  child: CircleAvatar(
                    backgroundColor: Color(AppColors.blue),
                    child: Text(
                      "${snapshot.data?.nome[0]}",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        onTap: () => Home.logout(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sair",
                              style: GoogleFonts.inter(
                                color: Color(AppColors.red),
                                fontSize: constraints.maxWidth * .04,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              Icons.exit_to_app_rounded,
                              color: Color(AppColors.red),
                              size: constraints.maxWidth * .05,
                            )
                          ],
                        ),
                      ),
                    ];
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
