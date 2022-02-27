import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pintura/app/modules/inicio/inicio_store.dart';
import 'package:pintura/app/modules/inicio/widgets/dialog_compartilhar_desenho.dart';
import 'package:pintura/app/modules/inicio/widgets/dialog_delete_desenho.dart';
import 'package:pintura/app/shared/ui/app_ui.dart';
import 'package:pintura/app/shared/ui/widgets/app_button.dart';
import 'package:pintura/app/shared/ui/widgets/app_button_outlined.dart';

class DesenhosPage extends StatelessWidget {
  const DesenhosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(top: 15),
        child: SizedBox(
          width: size.width * .9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: size.width * .9 - 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "Galeria",
                      style: TextStyle(
                        color: Color(0xff171717),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Visualize os seus desenhos",
                      style: TextStyle(
                        color: Color(0xff171717),
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                child: exibirFotos(context),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget exibirFotos(context) {
    final InicioStore store = Modular.get();

    final children = <Widget>[];

    if (store.fotos.isEmpty) {
      return Column(
        children: [semDesenho(context)],
      );
    }

    for (int i = 0; i < store.fotos.length; i++) {
      children.add(gerarDesenho(i, context));
    }

    return Column(children: children);
  }

  Widget gerarDesenho(int index, context) {
    final InicioStore store = Modular.get();

    var size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        const SizedBox(
          height: 7,
        ),
        Container(
          width: size.width * .8 + 2,
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
          child: Column(
            children: <Widget>[
              Container(
                width: size.width * .8,
                height: size.height * .6,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                  image: DecorationImage(
                      image: FileImage(
                        File(store.fotos[index].caminho!),
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                color: const Color(0xffeeeeee),
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  right: 10,
                  left: 10,
                ),
                child: AppButton(
                  label: 'Compartilhar',
                  height: 45,
                  width: size.width * .9 - 20,
                  icone: const Icon(
                    Icons.share,
                    size: 20,
                    color: Colors.white,
                  ),
                  onPressed: () => showDialogCompartilharDesenho(
                      context, store.fotos[index].caminho!),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: AppButtonOutlined(
                  label: 'Excluir',
                  height: 45,
                  width: size.width * .9 - 20,
                  color: AppUi.corPrincipal,
                  icone: const Icon(
                    Icons.delete,
                    size: 18,
                    color: AppUi.corPrincipal,
                  ),
                  onPressed: () =>
                      showDialogDeleteDesenho(context, store.fotos[index]),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 7,
        )
      ],
    );
  }

  Widget semDesenho(context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        const SizedBox(
          height: 7,
        ),
        Container(
          width: size.width * .8 + 2,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            border: Border.all(width: 1, color: const Color(0xffeeeeee)),
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: size.width * .8,
                height: size.width * .95,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: size.width * .5,
                      child: const Text(
                        "Sem desenho, faça um novo desenho e compartilhe",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff171717),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 7,
        )
      ],
    );
  }
}
