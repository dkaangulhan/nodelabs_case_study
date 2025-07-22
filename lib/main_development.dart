import 'package:auth_repository/auth_repository.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:nodelabs_case_study/app/app.dart';
import 'package:nodelabs_case_study/bootstrap.dart';

void main() {
  final apiClient = ApiClient();

  final authRepository = AuthRepository(apiClient);
  final cacheRepository = CacheRepository();

  bootstrap(
    () => App(
      authRepository: authRepository,
      cacheRepository: cacheRepository,
    ),
  );
}
