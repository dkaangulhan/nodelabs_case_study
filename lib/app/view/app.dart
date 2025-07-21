import 'package:flutter/material.dart';
import 'package:nodelabs_case_study/app_router/app_router.dart';
import 'package:nodelabs_case_study/l10n/l10n.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: const NodelabsCaseStudyTheme().themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: AppRouter(
        navigatorKey: GlobalKey<NavigatorState>(),
        debugLogDiagnostics: true,
      ).routes,
    );
  }
}
