import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pintura/app/models/Foto.dart';
import 'package:pintura/app/modules/inicio/inicio_store.dart';
import 'package:pintura/app/shared/ui/app_ui.dart';
import 'package:pintura/app/shared/ui/widgets/app_button.dart';
import 'package:pintura/app/shared/ui/widgets/app_button_outlined.dart';

showDialogDeleteDesenho(BuildContext context, Foto desenho) {
  final InicioStore store = Modular.get();

  var size = MediaQuery.of(context).size;

  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        contentPadding:
            const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 20),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Text(
                "Excluir desenho",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppUi.corPrincipal,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Realmente deseja excluir esse desenho?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: AppUi.corPreto,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xffeeeeee),
                  ),
                  color: Colors.white,
                ),
                child: Container(
                  height: size.height * .52,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.white,
                    image: DecorationImage(
                      image: FileImage(File(desenho.caminho!)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              AppButton(
                label: 'Excluir',
                width: size.width,
                height: 45,
                onPressed: () async {
                  store.deleteDesenho(desenho);
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              AppButtonOutlined(
                label: 'Cancelar',
                height: 45,
                width: size.width,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      );
    },
  );
}
