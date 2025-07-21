import 'package:auth_repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nodelabs_case_study/app/app.dart';
import 'package:nodelabs_case_study/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(App(
        authRepository: AuthRepository(ApiClient()),
      ));
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
