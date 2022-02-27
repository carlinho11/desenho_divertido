import '../inicio/inicio_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'inicio_page.dart';

class InicioModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => InicioStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => InicioPage()),
  ];
}
