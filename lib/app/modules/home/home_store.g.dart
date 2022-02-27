// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$opacityAtom = Atom(name: 'HomeStoreBase.opacity');

  @override
  double get opacity {
    _$opacityAtom.reportRead();
    return super.opacity;
  }

  @override
  set opacity(double value) {
    _$opacityAtom.reportWrite(value, super.opacity, () {
      super.opacity = value;
    });
  }

  final _$strokeWidthAtom = Atom(name: 'HomeStoreBase.strokeWidth');

  @override
  double get strokeWidth {
    _$strokeWidthAtom.reportRead();
    return super.strokeWidth;
  }

  @override
  set strokeWidth(double value) {
    _$strokeWidthAtom.reportWrite(value, super.strokeWidth, () {
      super.strokeWidth = value;
    });
  }

  final _$modoApagarAtom = Atom(name: 'HomeStoreBase.modoApagar');

  @override
  bool get modoApagar {
    _$modoApagarAtom.reportRead();
    return super.modoApagar;
  }

  @override
  set modoApagar(bool value) {
    _$modoApagarAtom.reportWrite(value, super.modoApagar, () {
      super.modoApagar = value;
    });
  }

  final _$showBottomListAtom = Atom(name: 'HomeStoreBase.showBottomList');

  @override
  bool get showBottomList {
    _$showBottomListAtom.reportRead();
    return super.showBottomList;
  }

  @override
  set showBottomList(bool value) {
    _$showBottomListAtom.reportWrite(value, super.showBottomList, () {
      super.showBottomList = value;
    });
  }

  final _$pointsAtom = Atom(name: 'HomeStoreBase.points');

  @override
  List<DrawingPoints> get points {
    _$pointsAtom.reportRead();
    return super.points;
  }

  @override
  set points(List<DrawingPoints> value) {
    _$pointsAtom.reportWrite(value, super.points, () {
      super.points = value;
    });
  }

  final _$imagemAtom = Atom(name: 'HomeStoreBase.imagem');

  @override
  String? get imagem {
    _$imagemAtom.reportRead();
    return super.imagem;
  }

  @override
  set imagem(String? value) {
    _$imagemAtom.reportWrite(value, super.imagem, () {
      super.imagem = value;
    });
  }

  @override
  String toString() {
    return '''
opacity: ${opacity},
strokeWidth: ${strokeWidth},
modoApagar: ${modoApagar},
showBottomList: ${showBottomList},
points: ${points},
imagem: ${imagem}
    ''';
  }
}
