import 'package:pintura/app/shared/utils/constants.dart';

class Perfil {
  int? idPerfil;
  String? foto;
  String? nome;
  String? email;
  Perfil({
    this.idPerfil,
    this.foto,
    this.nome,
    this.email,
  });

  Perfil.fromJson(Map<String, dynamic> json) {
    idPerfil = json[perfilId];
    foto = json[perfilFoto];
    nome = json[perfilNome];
    email = json[perfilEmail];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data[perfilId] = idPerfil;
    data[perfilFoto] = foto;
    data[perfilNome] = nome;
    data[perfilEmail] = email;
    return data;
  }
}
