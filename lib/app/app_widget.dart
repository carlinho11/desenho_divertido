import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desenho Divertido',
      initialRoute: '/',

      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      //supportedLocales: [
      //const Locale('pt', 'BR')
      //],
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.brown,
      ),
    ).modular();
  }
}
