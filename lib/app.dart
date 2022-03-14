import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterLearnApp/account/login/bloc/login_bloc.dart';
import 'package:flutterLearnApp/account/login/login_repository.dart';
import 'package:flutterLearnApp/account/register/bloc/register_bloc.dart';
import 'package:flutterLearnApp/account/settings/settings_screen.dart';
import 'package:flutterLearnApp/main/bloc/main_bloc.dart';
import 'package:flutterLearnApp/routes.dart';
import 'package:flutterLearnApp/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterLearnApp/shared/repository/account_repository.dart';
import 'package:flutterLearnApp/themes.dart';
import 'account/settings/bloc/settings_bloc.dart';

import 'account/login/login_screen.dart';
import 'account/register/register_screen.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

// jhipster-merlin-needle-import-add - JHipster will add new imports here

class FlutterLearnAppApp extends StatelessWidget {
  const FlutterLearnAppApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterLearnApp app',
      theme: Themes.jhLight,
      routes: {
        FlutterLearnAppRoutes.login: (context) {
          return BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(loginRepository: LoginRepository()),
            child: LoginScreen());
        },
        FlutterLearnAppRoutes.register: (context) {
          return BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(accountRepository: AccountRepository()),
            child: RegisterScreen());
        },
        FlutterLearnAppRoutes.main: (context) {
          return BlocProvider<MainBloc>(
            create: (context) => MainBloc(accountRepository: AccountRepository())
              ..add(Init()),
            child: MainScreen());
        },
      FlutterLearnAppRoutes.settings: (context) {
        return BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(accountRepository: AccountRepository())
            ..add(LoadCurrentUser()),
          child: SettingsScreen());
        },
        // jhipster-merlin-needle-route-add - JHipster will add new routes here
      },
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales
    );
  }
}
