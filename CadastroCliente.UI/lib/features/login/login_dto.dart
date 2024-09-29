import 'package:flutter/cupertino.dart';

class LoginDto {
  LoginDto({required this.email, required this.senha});

  String email;
  String senha;

  Map<String, dynamic> toJson() => {"email": email, "senha": senha};

  factory LoginDto.fromTextController(TextEditingController emailController,
          TextEditingController senhaController) =>
      LoginDto(
        email: emailController.text,
        senha: senhaController.text,
      );
}
