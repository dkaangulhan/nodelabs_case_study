import 'package:auth_repository/auth_repository.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:nodelabs_case_study/app_router/app_router.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';

class App extends StatelessWidget {
  const App({
    required AuthRepository authRepository,
    required CacheRepository cacheRepository,
    required MovieRepository movieRepository,
    required AppRouter appRouter,
    super.key,
  })  : _authRepository = authRepository,
        _cacheRepository = cacheRepository,
        _movieRepository = movieRepository,
        _appRouter = appRouter;

  final AuthRepository _authRepository;
  final CacheRepository _cacheRepository;
  final MovieRepository _movieRepository;
  final AppRouter _appRouter;

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
        RepositoryProvider.value(
          value: _movieRepository,
        ),
      ],
      child: TranslationProvider(
        child: MaterialApp.router(
          theme: const NodelabsCaseStudyTheme().themeData,
          routerConfig: _appRouter.routes,
        ),
      ),
    );
  }
}
