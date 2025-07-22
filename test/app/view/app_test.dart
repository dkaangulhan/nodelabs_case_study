import 'package:flutter_test/flutter_test.dart';
import 'package:nodelabs_case_study/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      // await tester.pumpWidget(
      //   App(
      //     authRepository: AuthRepository(ApiClient()),
      //     cac
      //   ),
      // );
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
