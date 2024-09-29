class UserEntity {
  UserEntity(
      {required this.cpf,
      required this.email,
      required this.nome,
      required this.token});

  String nome;
  String cpf;
  String email;
  String token;

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        cpf: json["cpf"],
        email: json["email"],
        nome: json["nome"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "cpf": cpf,
        "email": email,
        "nome": nome,
        "token": token,
      };
}
