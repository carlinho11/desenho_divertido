import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pintura/app/shared/ui/app_ui.dart';
import 'package:pintura/app/shared/ui/widgets/app_button.dart';
import 'package:pintura/app/shared/ui/widgets/app_button_outlined.dart';

Future<bool> showDialogHomeSair(BuildContext context) {
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
                "Sair desta Tela",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppUi.corPreto,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                "Você realmente deseja sair sem salvar o desenho?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: AppUi.corPreto,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                label: 'Confirmar',
                width: size.width,
                height: 45,
                onPressed: () {
                  Modular.to.pop();
                  Modular.to.pop();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              AppButtonOutlined(
                label: 'Cancelar',
                height: 45,
                width: size.width,
                onPressed: () {
                  Modular.to.pop();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
  return Future.value(false);
}
