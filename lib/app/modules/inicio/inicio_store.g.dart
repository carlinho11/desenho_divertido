// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inicio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InicioStore on _InicioStoreBase, Store {
  final _$fotosAtom = Atom(name: '_InicioStoreBase.fotos');

  @override
  List<Foto> get fotos {
    _$fotosAtom.reportRead();
    return super.fotos;
  }

  @override
  set fotos(List<Foto> value) {
    _$fotosAtom.reportWrite(value, super.fotos, () {
      super.fotos = value;
    });
  }

  final _$nomeAtom = Atom(name: '_InicioStoreBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$emailAtom = Atom(name: '_InicioStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$fotoAtom = Atom(name: '_InicioStoreBase.foto');

  @override
  String get foto {
    _$fotoAtom.reportRead();
    return super.foto;
  }

  @override
  set foto(String value) {
    _$fotoAtom.reportWrite(value, super.foto, () {
      super.foto = value;
    });
  }

  final _$exibirPropagandaAtom =
      Atom(name: '_InicioStoreBase.exibirPropaganda');

  @override
  bool get exibirPropaganda {
    _$exibirPropagandaAtom.reportRead();
    return super.exibirPropaganda;
  }

  @override
  set exibirPropaganda(bool value) {
    _$exibirPropagandaAtom.reportWrite(value, super.exibirPropaganda, () {
      super.exibirPropaganda = value;
    });
  }

  final _$statusAtom = Atom(name: '_InicioStoreBase.status');

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

  final _$posicaoAtom = Atom(name: '_InicioStoreBase.posicao');

  @override
  int get posicao {
    _$posicaoAtom.reportRead();
    return super.posicao;
  }

  @override
  set posicao(int value) {
    _$posicaoAtom.reportWrite(value, super.posicao, () {
      super.posicao = value;
    });
  }

  @override
  String toString() {
    return '''
fotos: ${fotos},
nome: ${nome},
email: ${email},
foto: ${foto},
exibirPropaganda: ${exibirPropaganda},
status: ${status},
posicao: ${posicao}
    ''';
  }
}
