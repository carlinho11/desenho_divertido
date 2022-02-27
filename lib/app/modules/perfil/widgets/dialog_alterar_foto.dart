import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pintura/app/modules/perfil/perfil_store.dart';
import 'package:pintura/app/shared/ui/app_ui.dart';
import 'package:pintura/app/shared/ui/widgets/app_button_outlined.dart';

showDialogAlterarFoto(BuildContext context) {
  final PerfilStore store = Modular.get();

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
                "Definir Foto",
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
                "Personalize o seu perfil com a foto desejada.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: AppUi.corPreto,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        store.pegarImagemCamera();
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.only(
                            right: 40,
                            top: size.height * .04,
                            bottom: size.height * .04),
                        child: Column(
                          children: const <Widget>[
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Icon(
                                Icons.photo_camera,
                                color: AppUi.corPreto,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Câmera",
                              style: TextStyle(
                                color: AppUi.corPreto,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      )),
                  Container(
                    width: .3,
                    height: 40,
                    color: Colors.grey,
                  ),
                  GestureDetector(
                    onTap: () {
                      store.pegarImagemGaleria();
                      Navigator.pop(context);
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.only(
                          left: 40,
                          top: size.height * .04,
                          bottom: size.height * .04),
                      child: Column(
                        children: const <Widget>[
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Icon(
                              Icons.collections,
                              color: AppUi.corPreto,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Galeria",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppUi.corPreto,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
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
