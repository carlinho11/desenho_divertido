import 'package:pintura/app/models/Perfil.dart';
import 'package:pintura/app/shared/utils/constants.dart';
import 'package:pintura/app/shared/utils/dados.dart';
import 'package:sqflite/sqflite.dart';

class PerfilDados {
  Dados dados = Dados();

  Future<int> updatePerfil(Perfil perfil) async {
    try {
      Database db = await dados.dataBase;
      return await db.update(tablePerfil, perfil.toJson(),
          where: "$perfilId = ?", whereArgs: [perfil.idPerfil]);
    } catch (e) {
      throw (e);
    }
  }

  Future<Perfil> selectPerfil() async {
    try {
      Database db = await dados.dataBase;
      List<Perfil> retorno = [];
      List<Map<String, dynamic>> historicos = await db
          .rawQuery("SELECT * FROM $tablePerfil ORDER BY $perfilId DESC");
      historicos.forEach((historico) {
        retorno.add(Perfil.fromJson(historico));
      });
      return retorno[0];
    } catch (e) {
      throw (e);
    }
  }
}
