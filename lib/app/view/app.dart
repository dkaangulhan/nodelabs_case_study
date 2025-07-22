import 'package:auth_repository/auth_repository.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_case_study/app_router/app_router.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';

class App extends StatelessWidget {
  const App({
    required AuthRepository authRepository,
    required CacheRepository cacheRepository,
    super.key,
  })  : _authRepository = authRepository,
        _cacheRepository = cacheRepository;

  final AuthRepository _authRepository;
  final CacheRepository _cacheRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: _authRepository,
        ),
        RepositoryProvider.value(
          value: _cacheRepository,
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
