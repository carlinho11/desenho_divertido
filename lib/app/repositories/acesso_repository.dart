import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pintura/app/shared/utils/unity_config.dart';

class AcessoRepository {
  Dio dio = Dio(BaseOptions(connectTimeout: 10000));

  Future registrarAcesso(String info) async {
    try {
      String data =
          "${DateTime.now().day.toString().padLeft(2, '0')}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().year.toString()}";

      String hora =
          "${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}";

      final response = await dio.get("${UnityConfig.url}/$data&$hora&$info");

      log(response.data);
    } catch (e) {
      log(e.toString());
    }
  }
}
