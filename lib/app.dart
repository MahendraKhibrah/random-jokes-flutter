import 'dart:io';

import 'package:common/common.dart';
import 'package:common/utils/env.dart';
import 'package:common/utils/global_route.dart';
import 'package:common/utils/locale.dart';
import 'package:common/utils/route_key.dart';
import 'package:random_jokes/di/injection.dart';
import 'package:random_jokes/routes/routes.dart';
import 'package:flutter/material.dart';

void initApp(Env env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  AppEnv.setupEnv(env);

  getDependencies();

  while (Platform.localeName.isEmpty) {
    await Future.delayed(const Duration(microseconds: 200), () {});
  }

  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale(LocaleEnum.id.name),
        Locale(LocaleEnum.en.name),
      ],
      path: 'assets/translation',
      fallbackLocale: Locale(LocaleEnum.id.name),
      child: const App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: AppEnv.title,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoWillPopScopePageTransionsBuilder(),
            },
          ),
        ),
        initialRoute: RouteKey.root,
        routes: routes,
        navigatorKey: navigatorKey,
      ),
    );
  }

  void init() {}
}
