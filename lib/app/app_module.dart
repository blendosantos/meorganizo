import 'package:meorganizo/app/app_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:meorganizo/app/app_widget.dart';
import 'package:meorganizo/shared/db/hasura_connect.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies =>
      [Dependency((i) => HasuraConnectRepository())];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
