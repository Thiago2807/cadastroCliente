class UserDto {
  UserDto(
      {required this.cpf,
      required this.email,
      required this.nome,
      required this.token});

  String nome;
  String cpf;
  String email;
  String token;

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
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
