import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pintura/app/modules/inicio/inicio_store.dart';
import 'package:pintura/app/shared/ui/app_ui.dart';
import 'package:pintura/app/shared/ui/widgets/app_button.dart';
import 'package:pintura/app/shared/ui/widgets/app_button_outlined.dart';

showDialogSalvarDados(BuildContext context) {
  final InicioStore store = Modular.get();

  var size = MediaQuery.of(context).size;

  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  controllerNome.text = store.nome;
  controllerEmail.text = store.email;

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
                "Seus Dados",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppUi.corPreto,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: size.width * .9,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(width: 1, color: const Color(0xffeeeeee)),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: controllerNome,
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppUi.corPreto,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Nome',
                        hintStyle: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 10, top: 0, bottom: 0, right: 0),
                      ),
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: size.width * .9,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(width: 1, color: const Color(0xffeeeeee)),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: controllerEmail,
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppUi.corPreto,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 10, top: 0, bottom: 0, right: 0),
                      ),
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                label: 'Salvar',
                width: size.width,
                height: 45,
                onPressed: () async {
                  store.salvarNome(controllerNome.text);
                  store.salvarEmail(controllerEmail.text);
                  store.nome = controllerNome.text;
                  store.email = controllerEmail.text;
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
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      );
    },
  );
}
