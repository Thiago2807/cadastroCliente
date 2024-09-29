import 'package:cadastrocliente_ui/domain/entities/user_address_entity.dart';

class UserEntity {
  UserEntity({
    required this.id,
    required this.nome,
    required this.email,
    required this.cpf,
    required this.dtNascimento,
    required this.endereco,
  });

  String id;
  String nome;
  String cpf;
  String email;
  DateTime dtNascimento;
  UserAddressEntity endereco;

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      cpf: json['cpf'],
      dtNascimento: DateTime.parse(json['dtNascimento']),
      endereco: UserAddressEntity.fromJson(json['endereco']),
    );
  }
}
