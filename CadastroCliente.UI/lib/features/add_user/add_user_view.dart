import 'package:cadastrocliente_ui/features/add_user/components/button_add_user.dart';
import 'package:cadastrocliente_ui/shared/components/input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/colors.dart';
import 'add_user.dart';
import 'store/user_singleton.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({super.key});

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  bool addressSearch = false;

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _dtNascimentoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _logController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _complController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _ufController = TextEditingController();

  final FocusNode _nomeFocusNode = FocusNode();
  final FocusNode _cpfFocusNode = FocusNode();
  final FocusNode _dtNascimentoFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();

  final FocusNode _cepFocusNode = FocusNode();
  final FocusNode _logFocusNode = FocusNode();
  final FocusNode _complFocusNode = FocusNode();
  final FocusNode _bairroFocusNode = FocusNode();
  final FocusNode _cidadeFocusNode = FocusNode();
  final FocusNode _ufFocusNode = FocusNode();

  final FocusNode _senhaFocusNode = FocusNode();
  final FocusNode _cSenhaFocusNode = FocusNode();

  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _cSenhaController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _cpfController.dispose();
    _dtNascimentoController.dispose();
    _emailController.dispose();

    _cepController.dispose();
    _complController.dispose();
    _bairroController.dispose();
    _cidadeController.dispose();
    _ufController.dispose();

    _senhaController.dispose();
    _cSenhaController.dispose();

    _nomeFocusNode.dispose();
    _cpfFocusNode.dispose();
    _dtNascimentoFocusNode.dispose();
    _emailFocusNode.dispose();

    _cepFocusNode.dispose();
    _complFocusNode.dispose();
    _bairroFocusNode.dispose();
    _cidadeFocusNode.dispose();
    _ufFocusNode.dispose();
    _logFocusNode.dispose();

    _senhaFocusNode.dispose();
    _cSenhaFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) =>
            UserSingleton().objectEmpty(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Cadastro de Novo Usuário",
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .1),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Form(
                    child: Column(
                      children: [
                        InputForm(
                          editController: _nomeController,
                          hintText: "Nome",
                          obscureText: false,
                          focusNode: _nomeFocusNode,
                          onChanged: (e) => UserSingleton().nome = e,
                        ),
                        InputForm(
                          editController: _cpfController,
                          hintText: "Cpf",
                          obscureText: false,
                          focusNode: _cpfFocusNode,
                          onChanged: (e) => UserSingleton().cpf = e,
                        ),
                        InputForm(
                          editController: _dtNascimentoController,
                          hintText: "Data de Nascimento",
                          obscureText: false,
                          focusNode: _dtNascimentoFocusNode,
                          //onChanged: (e) => UserSingleton().dtNascimento = e,
                        ),
                        InputForm(
                          editController: _emailController,
                          hintText: "E-mail",
                          obscureText: false,
                          focusNode: _emailFocusNode,
                          onChanged: (e) => UserSingleton().email = e,
                        ),
                        Row(
                          children: [
                            if (UserSingleton().endereco.logradouro != "") ...[
                              Expanded(
                                flex: 2,
                                child: InputForm(
                                  editController: _logController,
                                  hintText: "Logradouro",
                                  obscureText: false,
                                  focusNode: _logFocusNode,
                                  enable: addressSearch,
                                  onChanged: (e) =>
                                      UserSingleton().endereco.logradouro = e,
                                ),
                              ),
                              SizedBox(width: size.width * .01),
                            ],
                            Expanded(
                              child: InputForm(
                                editController: _cepController,
                                hintText: "Cep",
                                obscureText: false,
                                focusNode: _cepFocusNode,
                                enable: !addressSearch,
                                mask: "#####-###",
                                textInputType: TextInputType.number,
                                onChanged: (e) =>
                                    UserSingleton().endereco.cep = e,
                              ),
                            ),
                          ],
                        ),
                        if (UserSingleton().endereco.logradouro != "")
                          InputForm(
                            editController: _complController,
                            hintText: "Complemento",
                            obscureText: false,
                            focusNode: _complFocusNode,
                            enable: true,
                            onChanged: (e) =>
                                UserSingleton().endereco.complemento = e,
                          ),
                        if (UserSingleton().endereco.logradouro != "")
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: InputForm(
                                  editController: _bairroController,
                                  hintText: "Bairro",
                                  obscureText: false,
                                  focusNode: _bairroFocusNode,
                                  enable: addressSearch,
                                  onChanged: (e) =>
                                      UserSingleton().endereco.bairro = e,
                                ),
                              ),
                              SizedBox(width: size.width * .01),
                              Expanded(
                                flex: 2,
                                child: InputForm(
                                  editController: _cidadeController,
                                  hintText: "Cidade",
                                  obscureText: false,
                                  focusNode: _cidadeFocusNode,
                                  enable: !addressSearch,
                                  onChanged: (e) =>
                                      UserSingleton().endereco.localidade = e,
                                ),
                              ),
                              SizedBox(width: size.width * .01),
                              Expanded(
                                flex: 1,
                                child: InputForm(
                                  editController: _ufController,
                                  hintText: "Uf",
                                  obscureText: false,
                                  focusNode: _ufFocusNode,
                                  enable: !addressSearch,
                                  onChanged: (e) =>
                                      UserSingleton().endereco.uf = e,
                                ),
                              ),
                            ],
                          ),
                        if (UserSingleton().endereco.logradouro != "") ...[
                          SizedBox(height: size.height * .02),
                          InputForm(
                            editController: _senhaController,
                            hintText: "Senha",
                            obscureText: false,
                            focusNode: _senhaFocusNode,
                            enable: true,
                          ),
                          InputForm(
                            editController: _cSenhaController,
                            hintText: "Confirmar senha",
                            obscureText: false,
                            focusNode: _cSenhaFocusNode,
                            enable: true,
                          ),
                        ],
                        SizedBox(height: size.height * .02),
                        ButtonAddUser(
                          function: () async {
                            if (UserSingleton().endereco.logradouro == "") {
                              final dataAddress =
                                  await AddUser.requestSearchCep(context);

                              if (dataAddress != null) {
                                setState(() {
                                  UserSingleton().endereco = dataAddress;
                                  _logController.text =
                                      UserSingleton().endereco.logradouro;
                                  _complController.text =
                                      UserSingleton().endereco.complemento;
                                  _bairroController.text =
                                      UserSingleton().endereco.bairro;
                                  _cidadeController.text =
                                      UserSingleton().endereco.localidade;
                                  _ufController.text =
                                      UserSingleton().endereco.uf;

                                  addressSearch = true;
                                });
                              }
                            } else {
                              AddUser.requestAddClient(
                                  context, _senhaController);
                            }
                          },
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                UserSingleton().endereco.logradouro == ""
                                    ? "Pesquisar Cep"
                                    : "Cadastrar",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: size.width * .01),
                              Icon(
                                Icons.search_rounded,
                                color: Colors.white,
                                size: size.width * .03,
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
          ),
        ),
      ),
    );
  }
}
