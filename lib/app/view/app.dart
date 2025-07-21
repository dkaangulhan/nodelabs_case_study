import 'package:flutter/material.dart';
import 'package:nodelabs_case_study/app_router/app_router.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return TranslationProvider(
      child: MaterialApp.router(
        theme: const NodelabsCaseStudyTheme().themeData,
        routerConfig: AppRouter(
          navigatorKey: GlobalKey<NavigatorState>(),
          debugLogDiagnostics: true,
        ).routes,
      ),
    );
  }
}
