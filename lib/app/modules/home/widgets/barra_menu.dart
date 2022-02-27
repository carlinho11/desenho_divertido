import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pintura/app/modules/home/home_store.dart';
import 'package:pintura/app/modules/home/widgets/dialog_clean_desenho.dart';
import 'package:pintura/app/modules/home/widgets/dialog_color_picker.dart';
import 'package:pintura/app/shared/ui/app_ui.dart';

class BarraMenu extends StatelessWidget {
  const BarraMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeStore store = Modular.get();

    return Container(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              blurRadius: 1,
              offset: Offset(.4, 1))
        ],
        color: AppUi.corPrincipal,
      ),
      child: Observer(builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Visibility(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(bottom: 5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        blurRadius: 1,
                        offset: Offset(.4, 1),
                      )
                    ],
                    color: Colors.white,
                  ),
                  child: Slider(
                      value: (store.selectedMode == SelectedMode.StrokeWidth)
                          ? store.strokeWidth
                          : store.opacity,
                      max: (store.selectedMode == SelectedMode.StrokeWidth)
                          ? 50.0
                          : 1.0,
                      min: 0.0,
                      onChanged: (val) {
                        if (store.selectedMode == SelectedMode.StrokeWidth) {
                          store.strokeWidth = val;
                        } else {
                          store.opacity = val;
                        }
                      }),
                ),
                visible: store.showBottomList,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.transparent,
                      child: const Icon(
                        Icons.album,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      if (store.selectedMode == SelectedMode.StrokeWidth) {
                        store.showBottomList = !store.showBottomList;
                      }
                      store.selectedMode = SelectedMode.StrokeWidth;
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.transparent,
                      child: const Icon(
                        Icons.opacity,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      if (store.selectedMode == SelectedMode.Opacity) {
                        store.showBottomList = !store.showBottomList;
                      }
                      store.selectedMode = SelectedMode.Opacity;
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: !store.modoApagar
                          ? BoxDecoration(
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, .3),
                                    blurRadius: 5,
                                    offset: Offset(.1, 1))
                              ],
                              color: store.selectedColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            )
                          : const BoxDecoration(
                              color: Colors.transparent,
                            ),
                      child: const Icon(
                        Icons.color_lens,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () async {
                      store.showBottomList = false;
                      await showDialogColorPicker(context);
                      store.modoApagar = false;
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: store.modoApagar
                          ? const BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, .3),
                                    blurRadius: 5,
                                    offset: Offset(.1, 1))
                              ],
                              color: Colors.black87,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            )
                          : const BoxDecoration(
                              color: Colors.transparent,
                            ),
                      child: const Icon(
                        Icons.backspace,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      if (store.modoApagar) {
                        store.modoApagar = false;
                      } else {
                        store.modoApagar = true;
                      }
                      store.showBottomList = false;
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.transparent,
                      child: const Icon(
                        Icons.delete_forever,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () => showDialogCleanDesenho(context),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
