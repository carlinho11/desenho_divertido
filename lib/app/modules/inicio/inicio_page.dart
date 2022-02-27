import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pintura/app/modules/inicio/inicio_store.dart';
import 'package:flutter/material.dart';
import 'package:pintura/app/modules/inicio/widgets/desenhos_page.dart';
import 'package:pintura/app/modules/inicio/widgets/drawer_page.dart';
import 'package:pintura/app/modules/inicio/widgets/top_inicio_page.dart';
import 'package:pintura/app/shared/ui/app_ui.dart';
import 'package:pintura/app/shared/utils/unity_config.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class InicioPage extends StatefulWidget {
  final String title;
  const InicioPage({Key? key, this.title = 'InicioPage'}) : super(key: key);
  @override
  InicioPageState createState() => InicioPageState();
}

class InicioPageState extends ModularState<InicioPage, InicioStore> {
  @override
  void initState() {
    controller.iniciar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      key: store.scaffoldKey,
      backgroundColor: AppUi.corFundo,
      drawer: const DrawerPage(),
      bottomNavigationBar: Observer(builder: (_) {
        return Visibility(
          visible: store.exibirPropaganda,
          child: Container(
            height: 50,
            alignment: Alignment.bottomCenter,
            child: UnityBannerAd(
              placementId: UnityConfig.placementId,
              onLoad: (placementId) => store.exibirPropaganda = true,
              onClick: (placementId) => store.exibirPropaganda = false,
              onFailed: (placementId, error, message) =>
                  store.exibirPropaganda = false,
            ),
          ),
        );
      }),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Observer(builder: (_) {
              return const TopInicioPage();
            }),
            Container(
              height: size.width * .05,
            ),
            SizedBox(
              width: size.width,
              child: Observer(
                builder: (_) {
                  switch (controller.status) {
                    case 0:
                      return const DesenhosPage();
                    case 1:
                      return const Center(
                        child: SizedBox(
                          width: 45,
                          height: 45,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    case 2:
                      return const Center(
                        child: Text('Erro'),
                      );
                    default:
                      return const Center(
                        child: Text('Erro'),
                      );
                  }
                },
              ),
            ),
            SizedBox(
              height: size.width * .05,
            ),
          ],
        ),
      ),
    );
  }
}
