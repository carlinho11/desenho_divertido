import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pintura/app/modules/inicio/inicio_store.dart';
import 'package:pintura/app/modules/inicio/widgets/dialog_salvar_dados.dart';
import 'package:pintura/app/shared/ui/app_ui.dart';

class TopInicioPage extends StatelessWidget {
  const TopInicioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InicioStore store = Modular.get();

    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: size.width,
          color: AppUi.corPrincipal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  store.scaffoldKey.currentState!.openDrawer();
                },
                child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.only(
                    top: 15 + MediaQuery.of(context).padding.top,
                    right: size.width * .05,
                    left: size.width * .05,
                    bottom: 5,
                  ),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => showDialogSalvarDados(context),
                  child: Container(
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      top: 15 + MediaQuery.of(context).padding.top,
                      right: size.width * .05,
                      left: size.width * .05,
                      bottom: 5,
                    ),
                    child: Text(
                      store.nome == '' ? 'Nome' : store.nome,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => showDialogSalvarDados(context),
                child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.only(
                    top: 15 + MediaQuery.of(context).padding.top,
                    right: size.width * .05,
                    left: size.width * .05,
                    bottom: 5,
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              height: 70,
              width: size.width,
              decoration: const BoxDecoration(
                color: Color(0xFF8B4513),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 15,
                  alignment: Alignment.center,
                ),
                _exibirDesenhar(context),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _exibirDesenhar(BuildContext context) {
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
                      "Novo Projeto",
                      style: TextStyle(
                        color: Color(0xff171717),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Faça um novo desenho e compartilhe.",
                      style: TextStyle(
                        color: Color(0xff171717),
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Modular.to.pushNamed("home");
                },
                child: Container(
                  alignment: Alignment.center,
                  //padding: EdgeInsets.all(10),
                  width: size.width * .8,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0),
                          blurRadius: 1,
                          offset: Offset(.4, 1))
                    ],
                    color: Color(0xFF8B4513), //Color(0xff1bd14e),
                  ),
                  height: 44,
                  child: const Text(
                    'Iniciar Desenho',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
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
}
