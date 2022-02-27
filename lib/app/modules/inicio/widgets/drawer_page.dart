import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pintura/app/modules/inicio/inicio_store.dart';
import 'package:pintura/app/shared/ui/app_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InicioStore store = Modular.get();

    var size = MediaQuery.of(context).size;

    return Drawer(
      backgroundColor: const Color(0xFFF2F1F1),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
            color: AppUi.corPrincipal,
          ),
          InkWell(
            onTap: () {
              Modular.to.pushNamed("perfil");
            },
            child: Container(
              padding: EdgeInsets.only(left: size.width * .05),
              height: 120,
              color: AppUi.corPrincipal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Observer(
                    builder: (_) {
                      return Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.2),
                                blurRadius: 3,
                                offset: Offset(.4, 1))
                          ],
                          image: DecorationImage(
                              image: store.foto == ''
                                  ? const AssetImage("images/sem-foto.png")
                                      as ImageProvider
                                  : FileImage(
                                      File(store.foto),
                                    ),
                              fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    store.nome == '' ? 'Nome' : store.nome,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    store.email == '' ? 'Configure o seu e-mail' : store.email,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            minLeadingWidth: 0,
            contentPadding: EdgeInsets.only(
              left: size.width * .05,
              right: size.width * .05,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 25,
            ),
            leading: const Icon(
              Icons.account_circle,
              color: Colors.grey,
              size: 25,
            ),
            title: const Text(
              'Perfil',
              style: TextStyle(
                color: Color(0xff171717),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            subtitle: const Text(
              'Defina as configurações do seu perfil',
              style: TextStyle(
                color: Color(0xff171717),
                fontSize: 12,
              ),
            ),
            onTap: () {
              Modular.to.pushNamed("perfil");
            },
          ),
          const Divider(
            height: 25,
          ),
          ListTile(
            minLeadingWidth: 0,
            contentPadding: EdgeInsets.only(
              left: size.width * .05,
              right: size.width * .05,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 25,
            ),
            leading: const Icon(
              Icons.brush,
              color: Colors.grey,
              size: 25,
            ),
            title: const Text(
              'Novo Desenho',
              style: TextStyle(
                color: Color(0xff171717),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            subtitle: const Text(
              'Faça um desenho e compartilhe',
              style: TextStyle(
                color: Color(0xff171717),
                fontSize: 12,
              ),
            ),
            onTap: () {
              Modular.to.pushNamed("home");
            },
          ),
          const Divider(
            height: 25,
          ),
          ListTile(
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.only(
                left: size.width * .05,
                right: size.width * .05,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 25,
              ),
              leading: const Icon(
                Icons.share,
                color: Colors.grey,
                size: 25,
              ),
              title: const Text(
                'Compartilhar',
                style: TextStyle(
                  color: Color(0xff171717),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              subtitle: const Text(
                'Compartilhe o app com os seus amigos',
                style: TextStyle(
                  color: Color(0xff171717),
                  fontSize: 12,
                ),
              ),
              onTap: () async {
                await store.compartilhar(
                    mensagem:
                        'Eu uso o melhor aplicativo de desenho. Baixe você também o Desenho Divertido! 😁🙌🖌\n\n#EuRecomendo #DesenhoDivertido\n\n https://play.google.com/store/apps/details?id=com.carlosroberto.pintura',
                    titulo: 'Desenho Divertido',
                    arquivo: 'images/banner.png',
                    extensao: 'png');
              }),
          const Divider(
            height: 25,
          ),
          ListTile(
            minLeadingWidth: 0,
            contentPadding: EdgeInsets.only(
              left: size.width * .05,
              right: size.width * .05,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 25,
            ),
            leading: const Icon(
              Icons.email,
              color: Colors.grey,
              size: 25,
            ),
            title: const Text(
              'Contato',
              style: TextStyle(
                color: Color(0xff171717),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            subtitle: const Text(
              'Enviar e-mail para o desenvolvedor',
              style: TextStyle(
                color: Color(0xff171717),
                fontSize: 12,
              ),
            ),
            onTap: () {
              launch(
                  "mailto:carlosrobertodosreis11@gmail.com?subject=Desenho Divertido&body=");
            },
          ),
          const Divider(
            height: 25,
          ),
          ListTile(
            minLeadingWidth: 0,
            contentPadding: EdgeInsets.only(
              left: size.width * .05,
              right: size.width * .05,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 25,
            ),
            leading: const Icon(
              Icons.exit_to_app,
              color: Colors.grey,
              size: 25,
            ),
            title: const Text(
              'Sair',
              style: TextStyle(
                color: Color(0xff171717),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            subtitle: const Text(
              'Clique aqui para sair do aplicativo',
              style: TextStyle(
                color: Color(0xff171717),
                fontSize: 12,
              ),
            ),
            onTap: () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
          ),
          const Divider(
            height: 25,
          ),
        ],
      ),
    );
  }
}
