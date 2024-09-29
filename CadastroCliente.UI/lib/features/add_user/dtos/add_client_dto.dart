import 'package:cadastrocliente_ui/domain/entities/user_entity.dart';

class AddClientDto extends UserEntity {
  AddClientDto({
    required super.id,
    required super.nome,
    required super.email,
    required super.cpf,
    required super.dtNascimento,
    required super.endereco,
    required this.senha,
  });

  String senha;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'cpf': cpf,
      'dtNascimento': dtNascimento.toIso8601String(),
      'endereco': endereco.toJson(),
      'senha': senha,
    };
  }
}
