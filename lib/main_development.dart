import 'package:analytics_repository/analytics_repository.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:external_media_repository/external_media_repository.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:nodelabs_case_study/app/app.dart';
import 'package:nodelabs_case_study/app/state/app_state.dart';
import 'package:nodelabs_case_study/app_router/app_router.dart';
import 'package:nodelabs_case_study/bootstrap.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  final apiClient = ApiClient();

  final authRepository = AuthRepository(apiClient);
  final cacheRepository = CacheRepository();
  final movieRepository = MovieRepository(apiClient);
  final userRepository = UserRepository(apiClient);
  const externalMediaRepository = ExternalMediaRepository();
  const analyticsRepository = AnalyticsRepository();

  bootstrap(
    () => App(
      authRepository: authRepository,
      cacheRepository: cacheRepository,
      movieRepository: movieRepository,
      userRepository: userRepository,
      externalMediaRepository: externalMediaRepository,
      analyticsRepository: analyticsRepository,
      appRouter: AppRouter(
        navigatorKey: appState.value.navigatorKey,
        debugLogDiagnostics: true,
      ),
    ),
  );
}
