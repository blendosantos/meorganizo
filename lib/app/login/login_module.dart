import 'package:hasura_connect/hasura_connect.dart';
import 'package:meorganizo/app/app_module.dart';
import 'package:meorganizo/app/login/login_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:meorganizo/app/login/login_page.dart';
import 'package:meorganizo/shared/db/hasura_connect.dart';

import 'login_repository.dart';

class LoginModule extends ModuleWidget {
  final HasuraConnect hasuraConnect =
      AppModule.to.getDependency<HasuraConnectRepository>().hasuraConnect;

  @override
  List<Bloc> get blocs => [
        Bloc((i) => LoginBloc(LoginModule.to.getDependency<LoginRepository>())),
      ];

  @override
  List<Dependency> get dependencies =>
      [Dependency((i) => LoginRepository(hasuraConnect))];

  @override
  Widget get view => LoginPage();

  static Inject get to => Inject<LoginModule>.of();
}
