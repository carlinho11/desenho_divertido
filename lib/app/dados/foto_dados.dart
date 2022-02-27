import 'package:pintura/app/models/Foto.dart';
import 'package:pintura/app/shared/utils/constants.dart';
import 'package:pintura/app/shared/utils/dados.dart';
import 'package:sqflite/sqflite.dart';

class FotoDados {
  Dados dados = Dados();

  Future<int> insertFoto(Foto foto) async {
    try {
      Database db = await dados.dataBase;
      int res = await db.insert(tableFoto, foto.toJson());
      return res;
    } catch (e) {
      throw (e);
    }
  }

  Future<int> deleteAllFoto() async {
    try {
      Database db = await dados.dataBase;
      return await db.rawDelete("DELETE FROM $tableFoto");
    } catch (e) {
      throw (e);
    }
  }

  Future<int> updateFoto(Foto foto) async {
    try {
      Database db = await dados.dataBase;
      return await db.update(tableFoto, foto.toJson(),
          where: "$fotoId = ?", whereArgs: [foto.idFoto]);
    } catch (e) {
      throw (e);
    }
  }

  Future<int> deleteFoto(Foto foto) async {
    try {
      Database db = await dados.dataBase;
      return await db
          .delete(tableFoto, where: "$fotoId = ?", whereArgs: [foto.idFoto]);
    } catch (e) {
      throw (e);
    }
  }

  Future<List<Foto>> selectFotos() async {
    try {
      Database db = await dados.dataBase;
      List<Foto> retorno = [];
      List<Map<String, dynamic>> historicos =
          await db.rawQuery("SELECT * FROM $tableFoto ORDER BY $fotoId DESC");
      historicos.forEach((historico) {
        retorno.add(Foto.fromJson(historico));
      });
      return retorno;
    } catch (e) {
      throw (e);
    }
  }

  Future<Foto> selectUltimaFoto() async {
    try {
      Database db = await dados.dataBase;
      List<Foto> retorno = [];
      List<Map<String, dynamic>> historicos =
          await db.rawQuery("SELECT * FROM $tableFoto ORDER BY $fotoId DESC");
      historicos.forEach((historico) {
        retorno.add(Foto.fromJson(historico));
      });
      return retorno[0];
    } catch (e) {
      throw (e);
    }
  }
}
