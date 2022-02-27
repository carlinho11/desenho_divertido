import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pintura/app/models/Foto.dart';
import 'package:pintura/app/repositories/acesso_repository.dart';
import 'package:pintura/app/dados/foto_dados.dart';
import 'package:pintura/app/shared/utils/unity_config.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

part 'inicio_store.g.dart';

class InicioStore = _InicioStoreBase with _$InicioStore;

abstract class _InicioStoreBase with Store {
  final AcessoRepository repository = AcessoRepository();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  FotoDados dadosFoto = FotoDados();

  @observable
  List<Foto> fotos = [];

  @observable
  String nome = '';

  @observable
  String email = '';

  @observable
  String foto = '';

  @observable
  bool exibirPropaganda = false;

  @observable
  int status = 0;

  @observable
  int posicao = 0;

  pegarPerfil() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    foto = prefs.getString('foto') ?? "";
    email = prefs.getString('email') ?? "";
    nome = prefs.getString('nome') ?? "";
  }

  salvarFoto(foto) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('foto', foto);
  }

  salvarNome(nome) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', nome);
  }

  salvarEmail(email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

  carregarFotos() async {
    try {
      status = 1;
      fotos = await dadosFoto.selectFotos();
      if (fotos.isNotEmpty) {
        status = 0;
      } else {
        status = 3;
      }
      registrarAcesso();
    } catch (e) {
      status = 2;
      log(e.toString());
    }
  }

  registrarAcesso() async {
    String info = "";
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    info = "Modelo:" + androidInfo.model.toString() + '|';
    info += (nome == '' ? '--' : nome) + '|';
    info += "Desenhos:" + fotos.length.toString();
    try {
      repository.registrarAcesso(info);
    } catch (e) {
      repository.registrarAcesso(info);
    }
  }

  Future<void> compartilharDesenho(String caminho) async {
    Share.shareFiles([caminho]);
  }

  void iniciar() async {
    pegarPerfil();
    UnityAds.init(
      gameId: UnityConfig.gameId,
      testMode: true,
      onComplete: () => exibirPropaganda = true,
      onFailed: (error, message) =>
          log('Initialization Failed: $error $message'),
    );
    carregarFotos();
  }

  Future compartilhar(
      {String? mensagem,
      String? titulo,
      String? arquivo,
      String? extensao}) async {
    File file = await imageToFile(arquivo: arquivo!, extensao: extensao!);

    try {
      await Share.shareFiles([file.path], text: mensagem, subject: titulo);
    } catch (e) {
      log(e.toString());
      await Share.share(mensagem!, subject: titulo);
    }
  }

  Future<File> imageToFile({String? arquivo, String? extensao}) async {
    var bytes = await rootBundle.load(arquivo!);
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/arquivo.$extensao');
    await file.writeAsBytes(
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
    return file;
  }

  deleteDesenho(Foto desenho) {
    try {
      dadosFoto.deleteFoto(desenho);
      final dir = Directory(desenho.caminho!);
      dir.deleteSync(recursive: true);
    } catch (e) {
      log(e.toString());
    }
    carregarFotos();
  }
}
