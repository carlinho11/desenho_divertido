import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pintura/app/modules/perfil/perfil_store.dart';
import 'package:pintura/app/modules/perfil/widgets/dialog_alterar_foto.dart';
import 'package:pintura/app/shared/ui/app_ui.dart';

class TopPerfilPage extends StatelessWidget {
  const TopPerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PerfilStore store = Modular.get();

    var size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Container(
            color: AppUi.corPrincipal,
            width: size.width,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        width: 85,
                        height: 85,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.2),
                                blurRadius: 3,
                                offset: Offset(.4, 1))
                          ],
                          image: DecorationImage(
                              image: store.controllerInicio.foto == ''
                                  ? const AssetImage("images/sem-foto.png")
                                      as ImageProvider
                                  : FileImage(
                                      File(store.controllerInicio.foto),
                                    ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      onTap: () => showDialogAlterarFoto(context),
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(top: 65, left: 56),
                            padding: const EdgeInsets.all(0),
                            alignment: Alignment.center,
                            width: 25.0,
                            height: 25.0,
                            child: const Icon(
                              Icons.add,
                              size: 18,
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.2),
                                    blurRadius: 3,
                                    offset: Offset(.4, 1))
                              ],
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          onTap: () => showDialogAlterarFoto(context),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  child: Text(
                    store.controllerInicio.nome == ''
                        ? 'Nome'
                        : store.controllerInicio.nome,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  child: Text(
                    store.controllerInicio.email == ''
                        ? 'Configure o seu e-mail'
                        : store.controllerInicio.email,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
