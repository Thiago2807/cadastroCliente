import 'dart:convert';

import 'package:cadastrocliente_ui/domain/entities/user_address_entity.dart';
import 'package:cadastrocliente_ui/domain/entities/user_entity.dart';
import 'package:cadastrocliente_ui/features/add_user/dtos/add_client_dto.dart';
import 'package:cadastrocliente_ui/features/add_user/store/user_singleton.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/http_config.dart';
import '../../domain/colors.dart';
import '../../domain/entities/error_entity.dart';

class AddUser {
  static Future<UserAddressEntity?> requestSearchCep(
      BuildContext context) async {
    try {
      final Dio dio = Dio();

      var response = await dio.get(
          "https://viacep.com.br/ws/${UserSingleton().endereco.cep}/json/");

      if (response.statusCode != 200) {
        throw Exception(response.data);
      }

      final dataAddress = UserAddressEntity.fromJson(response.data);

      return dataAddress;
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            showCloseIcon: true,
            backgroundColor: Color(AppColors.red),
            content: Text(e.toString().replaceAll("Exception: ", "")),
          ),
        );
      }
      return null;
    }
  }

  static Future<UserAddressEntity?> requestAddClient(
    BuildContext context,
      TextEditingController senhaController,
  ) async {
    try {
      final Dio dio = await HttpConfig.config();

      final entity = UserEntity.fromObject(UserSingleton());

      final data = AddClientDto(
        id: entity.id,
        nome: entity.nome,
        email: entity.email,
        cpf: entity.cpf,
        dtNascimento: entity.dtNascimento,
        endereco: entity.endereco,
        senha: senhaController.text,
      );

      var response = await dio.post(
        "/api/v1/pessoa/registro",
        data: data.toJson(),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        final errorDetails = ErrorEntity.fromJson(response.data);

        throw Exception(errorDetails.detail);
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            showCloseIcon: true,
            backgroundColor: Color(AppColors.blue),
            content: const Text("Usuário cadastrado com sucesso!"),
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            showCloseIcon: true,
            backgroundColor: Color(AppColors.red),
            content: Text(e.toString().replaceAll("Exception: ", "")),
          ),
        );
      }
    }
  }

  static bool validPassword(
      BuildContext context, String password, String cPassword) {
    if (cPassword != password) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: true,
          backgroundColor: Color(AppColors.red),
          content: const Text(
            "As senhas não coincidem. Verifique e tente novamente.",
          ),
        ),
      );
      return false;
    }
    return true;
  }
}
