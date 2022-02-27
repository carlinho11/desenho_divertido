import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pintura/app/models/Foto.dart';
import 'package:pintura/app/modules/inicio/widgets/dialog_compartilhar_desenho.dart';
import 'package:pintura/app/modules/inicio/inicio_store.dart';
import 'package:pintura/app/shared/ui/app_ui.dart';
import 'package:screenshot/screenshot.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final InicioStore controllerInicio = Modular.get();

  Color selectedColor = Colors.black;
  Color pickerColor = Colors.black;

  bool apagar = false;

  bool salvou = false;

  StrokeCap strokeCap = (Platform.isAndroid) ? StrokeCap.butt : StrokeCap.round;

  SelectedMode selectedMode = SelectedMode.StrokeWidth;

  File? image;
  File? croppedFile;

  Foto foto = Foto();

  @observable
  double opacity = 1.0;

  @observable
  double strokeWidth = 3.0;

  @observable
  bool modoApagar = false;

  @observable
  bool showBottomList = false;

  @observable
  List<DrawingPoints> points = [];

  @observable
  String? imagem;

  ScreenshotController screenshotController = ScreenshotController();

  cleanDesenho() {
    showBottomList = false;
    points.clear();
    points = points;
    imagem = null;
  }

  Future<void> salvarDesenho(context) async {
    screenshotController.capture().then((Uint8List? image) async {
      if (image != null) {
        Directory appDocDir = await getApplicationDocumentsDirectory();
        String path = appDocDir.path;
        String nome = DateTime.now().toString();
        if (foto.caminho != null) {
          final dir = Directory(foto.caminho.toString());
          dir.deleteSync(recursive: true);
        }
        await File('$path/$nome.png').writeAsBytes(image);
        File file = File('$path/$nome.png');
        foto.data = DateTime.now().day.toString().padLeft(2, '0') +
            "/" +
            DateTime.now().month.toString().padLeft(2, '0') +
            "/" +
            DateTime.now().year.toString().padLeft(4, '0');
        if (salvou) {
          if (foto.caminho != null) {
            foto = await controllerInicio.dadosFoto.selectUltimaFoto();
            foto.caminho = file.path;
            controllerInicio.dadosFoto.updateFoto(foto);
          }
        } else {
          foto.caminho = file.path;
          controllerInicio.dadosFoto.insertFoto(foto);
        }
        showDialogCompartilharDesenho(context, file.path);
        controllerInicio.carregarFotos();
        salvou = true;
      }
    }).catchError((onError) {
      log(onError);
    });
  }

  pegarImagemGaleria() async {
    try {
      final selectedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery, maxHeight: 2000, maxWidth: 2000);

      if (selectedFile != null) {
        image = File(selectedFile.path);
        croppedFile = await ImageCropper().cropImage(
          sourcePath: image!.path,
          maxHeight: 2000,
          maxWidth: 2000,
          compressQuality: 100,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          androidUiSettings: const AndroidUiSettings(
            toolbarTitle: 'Recortar',
            toolbarColor: AppUi.corPrincipal,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          iosUiSettings: const IOSUiSettings(
            title: 'Recortar',
            minimumAspectRatio: 1.0,
          ),
        );
        imagem = croppedFile!.path;
        points.clear();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  pegarImagemCamera() async {
    try {
      final selectedFile = await ImagePicker().pickImage(
          source: ImageSource.camera, maxHeight: 2000, maxWidth: 2000);

      if (selectedFile != null) {
        image = File(selectedFile.path);
        croppedFile = await ImageCropper().cropImage(
          sourcePath: image!.path,
          maxHeight: 1000,
          maxWidth: 563,
          androidUiSettings: const AndroidUiSettings(
            toolbarTitle: 'Recortar',
            toolbarColor: AppUi.corPrincipal,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
          ),
          iosUiSettings: const IOSUiSettings(
            title: 'Recortar',
            minimumAspectRatio: 1.0,
          ),
        );
        imagem = croppedFile!.path;
        points.clear();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

enum SelectedMode { StrokeWidth, Opacity }

class DrawingPoints {
  Paint paint;
  Offset points;
  DrawingPoints({required this.points, required this.paint});
}
