import 'package:pintura/app/shared/utils/constants.dart';

class Foto {
  int? idFoto;
  String? data;
  String? caminho;

  Foto({this.idFoto, this.data, this.caminho});

  Foto.fromJson(Map<String, dynamic> json) {
    idFoto = json[fotoId];
    data = json[fotoData];
    caminho = json[fotoCaminho];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[fotoId] = this.idFoto;
    data[fotoData] = this.data;
    data[fotoCaminho] = this.caminho;
    return data;
  }
}
