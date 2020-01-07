import 'package:meorganizo/app/tab/tab_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:meorganizo/app/tab/tab_page.dart';

class TabModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => TabBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => TabPage();

  static Inject get to => Inject<TabModule>.of();
}
