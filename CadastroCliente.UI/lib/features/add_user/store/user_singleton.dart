import '../../../domain/entities/user_address_entity.dart';
import '../../../domain/entities/user_entity.dart';

class UserSingleton extends UserEntity {
  // Instância estática privada
  static UserSingleton _instance = UserSingleton._internal(
    id: '',
    nome: '',
    email: '',
    cpf: '',
    dtNascimento: DateTime.now(),
    endereco: UserAddressEntity(
      cep: '',
      logradouro: '',
      complemento: '',
      unidade: '',
      bairro: '',
      localidade: '',
      uf: '',
      estado: '',
      regiao: '',
      ibge: '',
      gia: '',
      ddd: '',
      siafi: '',
    ),
  );

  // Construtor privado
  UserSingleton._internal({
    required String id,
    required String nome,
    required String email,
    required String cpf,
    required DateTime dtNascimento,
    required UserAddressEntity endereco,
  }) : super(
          id: id,
          nome: nome,
          email: email,
          cpf: cpf,
          dtNascimento: dtNascimento,
          endereco: endereco,
        );

  // Fábrica para retornar a instância
  factory UserSingleton() {
    return _instance;
  }

  void objectEmpty() {
    UserSingleton._instance = UserSingleton._internal(
      id: '',
      nome: '',
      email: '',
      cpf: '',
      dtNascimento: DateTime.now(),
      endereco: UserAddressEntity(
        cep: '',
        logradouro: '',
        complemento: '',
        unidade: '',
        bairro: '',
        localidade: '',
        uf: '',
        estado: '',
        regiao: '',
        ibge: '',
        gia: '',
        ddd: '',
        siafi: '',
      ),
    );
  }

  // Método para cadastrar um novo usuário
  void registerNewUser({
    required String id,
    required String nome,
    required String email,
    required String cpf,
    required DateTime dtNascimento,
    required UserAddressEntity endereco,
  }) {
    this.id = id;
    this.nome = nome;
    this.email = email;
    this.cpf = cpf;
    this.dtNascimento = dtNascimento;
    this.endereco = endereco;
  }
}
