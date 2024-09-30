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
      backgroundColor: Colors.white,
      color: Color(AppColors.blue),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data![index].nome,
                            style: GoogleFonts.inter(
                              color: Color(AppColors.black),
                              fontSize: size.width * .03,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: size.height * .001),
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
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: constraints.maxWidth * .04
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: constraints.maxWidth * .01),

                            Text(
                              snapshot.data![index].email,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                color: Color(AppColors.black),
                                fontSize: constraints.maxWidth * .045,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: constraints.maxWidth * .01),
                            Text(
                              "Data de Nascimento: ${DateFormat("dd/MM/yy").format(snapshot.data![index].dtNascimento)}",
                              textAlign: TextAlign.start,
                                style: GoogleFonts.inter(
                                  color: Color(AppColors.black),
                                  fontSize: constraints.maxWidth * .045,
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
