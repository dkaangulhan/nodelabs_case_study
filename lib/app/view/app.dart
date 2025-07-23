import 'package:auth_repository/auth_repository.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:external_media_repository/external_media_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:nodelabs_case_study/app_router/app_router.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';
import 'package:user_repository/user_repository.dart';

class App extends StatelessWidget {
  const App({
    required AuthRepository authRepository,
    required CacheRepository cacheRepository,
    required MovieRepository movieRepository,
    required UserRepository userRepository,
    required ExternalMediaRepository externalMediaRepository,
    required AppRouter appRouter,
    super.key,
  })  : _authRepository = authRepository,
        _cacheRepository = cacheRepository,
        _movieRepository = movieRepository,
        _userRepository = userRepository,
        _externalMediaRepository = externalMediaRepository,
        _appRouter = appRouter;

  final AuthRepository _authRepository;
  final CacheRepository _cacheRepository;
  final MovieRepository _movieRepository;
  final UserRepository _userRepository;
  final ExternalMediaRepository _externalMediaRepository;
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
        RepositoryProvider.value(
          value: _userRepository,
        ),
        RepositoryProvider.value(
          value: _externalMediaRepository,
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
