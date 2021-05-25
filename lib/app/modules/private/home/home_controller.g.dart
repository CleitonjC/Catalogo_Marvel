// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$characterDataWrapperAtom =
      Atom(name: '_HomeControllerBase.characterDataWrapper');

  @override
  CharacterDataWrapper? get characterDataWrapper {
    _$characterDataWrapperAtom.reportRead();
    return super.characterDataWrapper;
  }

  @override
  set characterDataWrapper(CharacterDataWrapper? value) {
    _$characterDataWrapperAtom.reportWrite(value, super.characterDataWrapper,
        () {
      super.characterDataWrapper = value;
    });
  }

  final _$carregandoAtom = Atom(name: '_HomeControllerBase.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  final _$getCharacterDataWrapperAsyncAction =
      AsyncAction('_HomeControllerBase.getCharacterDataWrapper');

  @override
  Future getCharacterDataWrapper() {
    return _$getCharacterDataWrapperAsyncAction
        .run(() => super.getCharacterDataWrapper());
  }

  @override
  String toString() {
    return '''
characterDataWrapper: ${characterDataWrapper},
carregando: ${carregando}
    ''';
  }
}
