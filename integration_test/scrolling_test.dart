import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:todoapp/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Scroll list and generate performance report', (tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Find all scrollable widgets
    final scrollables = find.byType(Scrollable);

    // Use the second Scrollable (assuming the second one is your main list)
    final listFinder = scrollables.at(1);

    // Perform the scroll action
    await tester.fling(listFinder, Offset(0, -300), 10000);
    await tester.pumpAndSettle();

    await tester.fling(listFinder, Offset(0, -300), 10000);
    await tester.pumpAndSettle();

    await tester.fling(listFinder, Offset(0, -300), 10000);
    await tester.pumpAndSettle();
  });
}
