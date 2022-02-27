import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pintura/app/modules/home/home_store.dart';

showDialogColorPicker(BuildContext context) {
  final HomeStore store = Modular.get();

  return ColorPicker(
    color: store.selectedColor,
    onColorChanged: (Color color) => store.selectedColor = color,
    width: 40,
    height: 40,
    borderRadius: 4,
    spacing: 5,
    runSpacing: 5,
    wheelDiameter: 155,
    heading: Text(
      'Selecione a cor',
      style: Theme.of(context).textTheme.subtitle1,
    ),
    subheading: Text(
      'Selecione a tonalidade da cor',
      style: Theme.of(context).textTheme.subtitle1,
    ),
    wheelSubheading: Text(
      'Cor selecionada e seus tons',
      style: Theme.of(context).textTheme.subtitle1,
    ),
    showMaterialName: true,
    showColorName: true,
    showColorCode: true,
    copyPasteBehavior: const ColorPickerCopyPasteBehavior(
      longPressMenu: true,
    ),
    materialNameTextStyle: Theme.of(context).textTheme.caption,
    colorNameTextStyle: Theme.of(context).textTheme.caption,
    colorCodeTextStyle: Theme.of(context).textTheme.caption,
    pickersEnabled: const <ColorPickerType, bool>{
      ColorPickerType.both: true,
      ColorPickerType.primary: false,
      ColorPickerType.accent: false,
      ColorPickerType.bw: false,
      ColorPickerType.custom: true,
      ColorPickerType.wheel: false,
    },
  ).showPickerDialog(
    context,
  );
}
