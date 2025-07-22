import 'package:auth_repository/auth_repository.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:nodelabs_case_study/app/app.dart';
import 'package:nodelabs_case_study/app_router/app_router.dart';
import 'package:nodelabs_case_study/bootstrap.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  final apiClient = ApiClient();

  final authRepository = AuthRepository(apiClient);
  final cacheRepository = CacheRepository();
  final movieRepository = MovieRepository(apiClient);
  final userRepository = UserRepository();

  bootstrap(
    () => App(
      authRepository: authRepository,
      cacheRepository: cacheRepository,
      movieRepository: movieRepository,
      userRepository: userRepository,
      appRouter: AppRouter(navigatorKey: GlobalKey<NavigatorState>()),
    ),
  );
}
