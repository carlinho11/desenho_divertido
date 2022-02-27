import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pintura/app/modules/home/home_store.dart';
import 'package:pintura/app/modules/home/widgets/barra_menu.dart';
import 'package:pintura/app/modules/home/widgets/dialog_home_sair.dart';
import 'package:pintura/app/shared/ui/app_ui.dart';
import 'package:pintura/app/shared/utils/desenhar.dart';
import 'package:screenshot/screenshot.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppUi.corPrincipal,
        actions: [
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.transparent,
              child: const Icon(
                Icons.undo,
                color: Colors.white,
              ),
            ),
            onTap: () {
              store.showBottomList = false;
              if (store.points.isNotEmpty) {
                store.points.removeLast();
                store.points = store.points;
              }
            },
            onLongPressStart: (detalhes) async {
              store.apagar = true;
              store.showBottomList = false;

              while (store.apagar) {
                if (store.points.isNotEmpty) {
                  store.points.removeLast();
                  store.points = store.points;
                }
                await Future.delayed(const Duration(milliseconds: 100));
              }
            },
            onLongPressEnd: (detalhes) {
              store.apagar = false;
            },
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              store.showBottomList = false;
              store.salvarDesenho(context);
            },
          ),
          PopupMenuButton<String>(
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                child: Text("Galeria"),
                value: '1',
              ),
              const PopupMenuItem<String>(
                child: Text("Câmera"),
                value: '2',
              ),
            ],
            onSelected: (valor) {
              store.showBottomList = false;
              if (valor == "1") {
                store.pegarImagemGaleria();
              } else if (valor == "2") {
                store.pegarImagemCamera();
              }
            },
          ),
        ],
        title: const Text(
          "Pintura",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async =>
            store.salvou ? Future.value(true) : showDialogHomeSair(context),
        child: Column(
          children: [
            Expanded(
              child: Screenshot(
                controller: store.screenshotController,
                child: Stack(
                  children: [
                    Observer(
                      builder: (_) {
                        if (store.imagem != null) {
                          return Container(
                            width: size.width,
                            height: size.height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                image: FileImage(
                                  File(store.imagem ?? ""),
                                ),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            color: Colors.white,
                            width: size.width,
                            height: size.height,
                          );
                        }
                      },
                    ),
                    GestureDetector(
                      onPanUpdate: (details) {
                        RenderBox renderBox =
                            context.findRenderObject() as RenderBox;
                        store.points.add(
                          DrawingPoints(
                            points:
                                renderBox.globalToLocal(details.localPosition),
                            paint: Paint()
                              ..strokeCap = store.strokeCap
                              ..isAntiAlias = true
                              ..color = store.modoApagar
                                  ? Colors.white
                                  : store.selectedColor
                                      .withOpacity(store.opacity)
                              ..strokeWidth = store.strokeWidth,
                          ),
                        );
                        store.points = store.points;
                      },
                      onPanStart: (details) {
                        RenderBox renderBox =
                            context.findRenderObject() as RenderBox;

                        store.points.add(
                          DrawingPoints(
                            points:
                                renderBox.globalToLocal(details.localPosition),
                            paint: Paint()
                              ..strokeCap = store.strokeCap
                              ..isAntiAlias = true
                              ..color = store.modoApagar
                                  ? Colors.white
                                  : store.selectedColor
                                      .withOpacity(store.opacity)
                              ..strokeWidth = store.strokeWidth,
                          ),
                        );
                        store.points = store.points;
                      },
                      onPanEnd: (details) {
                        store.points.add(
                          DrawingPoints(
                            points: const Offset(-1, -1),
                            paint: Paint(),
                          ),
                        );
                        store.points = store.points;
                      },
                      child: Observer(
                        builder: (_) {
                          return CustomPaint(
                            size: Size.infinite,
                            painter: Desenhar(
                              pointsList: store.points,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BarraMenu(),
    );
  }
}
