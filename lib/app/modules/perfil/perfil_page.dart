import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pintura/app/modules/inicio/widgets/dialog_salvar_dados.dart';
import 'package:pintura/app/modules/perfil/perfil_store.dart';
import 'package:pintura/app/modules/perfil/widgets/top_perfil_page.dart';
import 'package:pintura/app/shared/ui/app_ui.dart';

class PerfilPage extends StatefulWidget {
  final String title;

  const PerfilPage({Key? key, this.title = "Perfil"}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends ModularState<PerfilPage, PerfilStore> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppUi.corPrincipal,
        elevation: 0,
      ),
      backgroundColor: AppUi.corFundo,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Observer(
              builder: (_) {
                switch (controller.status) {
                  case 0:
                    return SizedBox(
                      child: Column(
                        children: <Widget>[
                          const TopPerfilPage(),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(20),
                            width: size.width * .90,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                  blurRadius: 20,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                _exibirTitulo("Informações"),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 1,
                                  color: AppUi.corFundo,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                _exibirItem(
                                    'Desenhos:',
                                    controller.controllerInicio.fotos.length
                                        .toString()),
                                _exibirItem(
                                    'Nome:',
                                    controller.controllerInicio.nome == ''
                                        ? '--'
                                        : controller.controllerInicio.nome),
                                _exibirItem(
                                    'E-mail:',
                                    controller.controllerInicio.email == ''
                                        ? '--'
                                        : controller.controllerInicio.email),
                                const SizedBox(
                                  height: 15,
                                ),
                                GestureDetector(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: size.width,
                                    //padding: const EdgeInsets.all(15),
                                    child: const Text(
                                      'Editar',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppUi.corPrincipal,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      boxShadow: const <BoxShadow>[
                                        BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0),
                                            blurRadius: 1,
                                            offset: Offset(.4, 1))
                                      ],
                                      border: Border.all(
                                        color: AppUi.corPrincipal,
                                        width: 1,
                                      ),
                                      color: Colors.white, //Color(0xff1bd14e),
                                    ),
                                    height: 44,
                                  ),
                                  onTap: () => showDialogSalvarDados(context),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                        ],
                      ),
                    );
                  case 1:
                    return Column(
                      children: <Widget>[
                        Container(
                          color: AppUi.corPrincipal,
                          width: size.width,
                          padding: const EdgeInsets.all(10),
                          height: 90,
                        ),
                        SizedBox(
                          width: size.width,
                          height: size.height - 180,
                          child: const Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  case 2:
                    return SizedBox(
                        width: size.width,
                        height: size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[Text("Erro")],
                        ));
                  case 3:
                    return SizedBox(
                      width: size.width,
                      height: size.height - 180,
                    );
                  default:
                    return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _exibirTitulo(String titulo) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            child: Text(
              titulo,
              style: const TextStyle(
                fontSize: 16,
                color: AppUi.corPreto,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _exibirItem(String descricao, String valor) {
    var size = MediaQuery.of(context).size;

    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: 10, left: 10),
          child: Text(
            descricao,
            style: const TextStyle(
              color: AppUi.corPreto,
              fontSize: 12,
            ),
          ),
          width: size.width * 0.24,
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          width: size.width * 0.5,
          child: Text(
            valor,
            style: const TextStyle(fontSize: 12),
          ),
        )
      ],
    );
  }
}
