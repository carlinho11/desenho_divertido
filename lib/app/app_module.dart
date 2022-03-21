import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pintura/app/modules/inicio/inicio_module.dart';
import 'package:pintura/app/modules/perfil/perfil_module.dart';
import 'package:pintura/app/repositories/acesso_repository_impl.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AcessoRepositoryImpl(i.get())),
    Bind((i) => Dio(BaseOptions(connectTimeout: 15000)))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: InicioModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/perfil', module: PerfilModule()),
  ];
}
