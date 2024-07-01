class UserModel {
  final String matricula;
  final String nome_usual;
  final String cpf;
  final String rg;
  final String data_nascimento;
  final String naturalidade;
  final String tipo_sanguineo;
  final String email;
  final String photo_url;
  final String tipo_vinculo;

  UserModel({
    required this.matricula,
    required this.nome_usual,
    required this.cpf,
    required this.rg,
    required this.data_nascimento,
    required this.naturalidade,
    required this.tipo_sanguineo,
    required this.email,
    required this.photo_url,
    required this.tipo_vinculo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      nome_usual: json['nome_usual'],
      matricula: json['matricula'],
      cpf: json['cpf'],
      rg: json['rg'],
      data_nascimento: json['data_nascimento'],
      naturalidade: json['naturalidade'],
      tipo_sanguineo: json['tipo_sanguineo'],
      email: json['email'],
      photo_url: json['url_foto_150x200'],
      tipo_vinculo: json['tipo_vinculo'],
    );
  }
}
