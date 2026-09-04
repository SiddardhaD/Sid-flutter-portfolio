// Basic smoke test — verifies the portfolio boots and shows the profile name.

import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('Portfolio boots and shows the profile name', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text(AppConstats.username), findsOneWidget);
    expect(find.text(AppConstats.userRole), findsOneWidget);
  });
}
