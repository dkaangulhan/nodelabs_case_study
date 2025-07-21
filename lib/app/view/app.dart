import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_case_study/app_router/app_router.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';

class App extends StatelessWidget {
  const App({
    required AuthRepository authRepository,
    super.key,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: _authRepository,
        ),
      ],
      child: TranslationProvider(
        child: MaterialApp.router(
          theme: const NodelabsCaseStudyTheme().themeData,
          routerConfig: AppRouter(
            navigatorKey: GlobalKey<NavigatorState>(),
            debugLogDiagnostics: true,
          ).routes,
        ),
      ),
    );
  }
}
