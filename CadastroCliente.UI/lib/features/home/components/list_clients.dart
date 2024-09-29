import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/colors.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../shared/format_data.dart';
import '../home.dart';
import 'package:intl/intl.dart';

class ListClients extends StatefulWidget {
  const ListClients({super.key});

  @override
  State<ListClients> createState() => _ListClientsState();
}

class _ListClientsState extends State<ListClients> {
  Future<List<UserEntity>>? listClient;

  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  Future<void> _refreshList() async {
    setState(() {
      listClient = Home.requestListClient(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return RefreshIndicator(
      onRefresh: _refreshList,
      child: FutureBuilder<List<UserEntity>>(
        future: listClient,
        builder:
            (BuildContext context, AsyncSnapshot<List<UserEntity>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              children: [
                SizedBox(height: size.height * .1),
                Text(
                  "Carregando a lista de clientes...",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      color: Color(AppColors.blue), fontSize: size.width * .05),
                ),
                SizedBox(height: size.height * .05),
                Center(
                  child: CircularProgressIndicator(
                    color: Color(AppColors.blue),
                    strokeWidth: 1.5,
                  ),
                ),
              ],
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(vertical: size.height * .01),
              padding: EdgeInsets.symmetric(
                vertical: size.height * .01,
                horizontal: size.width * .02,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(size.width * .02),
                boxShadow: [
                  BoxShadow(blurRadius: 10, color: Colors.grey.shade200),
                ],
              ),
              child: ExpansionTile(
                shape: InputBorder.none,
                iconColor: Color(AppColors.blue),
                title: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.deepOrangeAccent,
                        child: Text(
                          snapshot.data![index].nome[0],
                        ),
                      ),
                      SizedBox(width: size.width * .02),
                      SizedBox(
                        width: size.width * .6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              snapshot.data![index].nome,
                              style: GoogleFonts.inter(
                                color: Color(AppColors.black),
                                fontSize: size.width * .04,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              snapshot.data![index].email,
                              style: GoogleFonts.inter(
                                color: Colors.grey.shade400,
                                fontSize: size.width * .03,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: size.height * .02),
                            Text(
                              FormatData.formatCpf(snapshot.data![index].cpf),
                              style: GoogleFonts.inter(
                                color: Color(AppColors.black),
                                fontSize: size.width * .03,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) => Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: constraints.maxWidth * .02,
                        horizontal: constraints.maxWidth * .02,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Detalhes do usuário:",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.inter(
                              color: Color(AppColors.black),
                              fontSize: constraints.maxWidth * .05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: constraints.maxWidth * .005),
                          Text(
                            "Data de Nascimento: ${DateFormat("dd/MM/yy").format(snapshot.data![index].dtNascimento)}",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.inter(
                              color: Color(AppColors.black),
                              fontSize: constraints.maxWidth * .05,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: constraints.maxWidth * .01),
                          Text(
                            snapshot.data![index].endereco.formatAddress(),
                            textAlign: TextAlign.start,
                            style: GoogleFonts.inter(
                              color: Color(AppColors.black),
                              fontSize: constraints.maxWidth * .04,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
