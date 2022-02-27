import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pintura/app/modules/home/home_store.dart';
import 'package:pintura/app/shared/ui/app_ui.dart';
import 'package:pintura/app/shared/ui/widgets/app_button.dart';
import 'package:pintura/app/shared/ui/widgets/app_button_outlined.dart';

Future<bool> showDialogCleanDesenho(BuildContext context) {
  var size = MediaQuery.of(context).size;

  final HomeStore store = Modular.get();

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
                "Limpar Desenho",
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
                "Você realmente deseja limpar o que desenhou até agora?",
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
                  store.cleanDesenho();
                  Navigator.pop(context);
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
