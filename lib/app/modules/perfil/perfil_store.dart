import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pintura/app/modules/inicio/inicio_store.dart';

part 'perfil_store.g.dart';

class PerfilStore = _PerfilStoreBase with _$PerfilStore;

abstract class _PerfilStoreBase with Store {
  InicioStore controllerInicio = Modular.get();

  File? croppedFile;

  File? image;

  @observable
  int status =
      0; //1=Carregando|2=Erro|0=Concluído|3=Sem informação|4=Sem permissão

  @action
  pegarImagemCamera() async {
    try {
      final selectedFile = await ImagePicker().pickImage(
          source: ImageSource.camera, maxHeight: 2000, maxWidth: 2000);

      image = File(selectedFile!.path);

      croppedFile = await ImageCropper().cropImage(
        sourcePath: image!.path,
        maxHeight: 1000,
        maxWidth: 1000,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Recortar',
          toolbarColor: Color(0xFF8B4513),
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          activeControlsWidgetColor: Color(0xFF8B4513),
          lockAspectRatio: true,
        ),
        iosUiSettings: IOSUiSettings(
          title: 'Recortar',
          minimumAspectRatio: 1.0,
        ),
      );

      Directory appDocDir = await getApplicationDocumentsDirectory();

      String path = appDocDir.path;

      final File novaImagem =
          await croppedFile!.copy('$path/${DateTime.now()}.png');

      controllerInicio.foto = novaImagem.path;
      controllerInicio.salvarFoto(novaImagem.path);
      //controllerInicio.nome = cadastro.matricula;
      //controllerInicio.email = controllerHome.perfil;
    } catch (e) {
      print(e);
    }
  }

  @action
  pegarImagemGaleria() async {
    try {
      final selectedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery, maxHeight: 2000, maxWidth: 2000);

      image = File(selectedFile!.path);

      croppedFile = await ImageCropper().cropImage(
        sourcePath: image!.path,
        maxHeight: 1000,
        maxWidth: 1000,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Recortar',
          toolbarColor: Color(0xFF8B4513),
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          activeControlsWidgetColor: Color(0xFF8B4513),
          lockAspectRatio: true,
        ),
        iosUiSettings: IOSUiSettings(
          title: 'Recortar',
          minimumAspectRatio: 1.0,
        ),
      );

      Directory appDocDir = await getApplicationDocumentsDirectory();

      String path = appDocDir.path;

      final File novaImagem =
          await croppedFile!.copy('$path/${DateTime.now()}.png');

      controllerInicio.foto = novaImagem.path;
      controllerInicio.salvarFoto(novaImagem.path);
      //controllerInicio.nome = //cadastro.matricula;
      //controllerInicio.email = //controllerHome.perfil;
    } catch (e) {
      print(e);
    }
  }
}
