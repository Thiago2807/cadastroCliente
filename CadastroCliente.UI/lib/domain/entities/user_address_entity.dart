class UserAddressEntity {
  final String cep;
  final String logradouro;
  final String complemento;
  final String unidade;
  final String bairro;
  final String localidade;
  final String uf;
  final String estado;
  final String regiao;
  final String ibge;
  final String gia;
  final String ddd;
  final String siafi;

  UserAddressEntity({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.unidade,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.estado,
    required this.regiao,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });

  // Método para converter um JSON em um objeto Endereco
  factory UserAddressEntity.fromJson(Map<String, dynamic> json) => UserAddressEntity(
      cep: json['cep'],
      logradouro: json['logradouro'],
      complemento: json['complemento'],
      unidade: json['unidade'],
      bairro: json['bairro'],
      localidade: json['localidade'],
      uf: json['uf'],
      estado: json['estado'],
      regiao: json['regiao'],
      ibge: json['ibge'],
      gia: json['gia'],
      ddd: json['ddd'],
      siafi: json['siafi'],
    );

  String formatAddress() {
    String formattedAddress = '$logradouro, $bairro, $localidade - $uf, $cep';

    if (complemento.isNotEmpty) {
      formattedAddress += ' - $complemento';
    }

    return formattedAddress;
  }
}