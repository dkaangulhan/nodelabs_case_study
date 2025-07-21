import 'package:auth_repository/auth_repository.dart';
import 'package:nodelabs_case_study/app/app.dart';
import 'package:nodelabs_case_study/bootstrap.dart';

void main() {
  bootstrap(
    () => App(
      authRepository: AuthRepository(ApiClient()),
    ),
  );
}
