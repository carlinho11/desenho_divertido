// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilStore on _PerfilStoreBase, Store {
  final _$statusAtom = Atom(name: '_PerfilStoreBase.status');

  @override
  int get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(int value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$pegarImagemCameraAsyncAction =
      AsyncAction('_PerfilStoreBase.pegarImagemCamera');

  @override
  Future pegarImagemCamera() {
    return _$pegarImagemCameraAsyncAction.run(() => super.pegarImagemCamera());
  }

  final _$pegarImagemGaleriaAsyncAction =
      AsyncAction('_PerfilStoreBase.pegarImagemGaleria');

  @override
  Future pegarImagemGaleria() {
    return _$pegarImagemGaleriaAsyncAction
        .run(() => super.pegarImagemGaleria());
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
