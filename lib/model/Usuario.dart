class Usuario {
  int id;
  String nome;
  String email;
  String password;
  String pathFoto;

  Usuario({this.id, this.nome, this.email, this.password = "", this.pathFoto = ""});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    password = json['password'] ?? "";
    pathFoto = json['path_foto'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['password'] = this.password;
    data['path_foto'] = this.pathFoto;
    return data;
  }
}
