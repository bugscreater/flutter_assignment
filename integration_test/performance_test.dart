import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:todoapp/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Finds the search input field', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final searchFieldFinder = find.byKey(Key('search_input_field'));
    expect(searchFieldFinder, findsOneWidget);
  });
  testWidgets('Prints the inner text of todos list items',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();

    final todosListContainerFinder = find.byKey(Key('todos list'));
    expect(todosListContainerFinder, findsOneWidget);
    await tester.drag(todosListContainerFinder, Offset(0, -500));
    await tester.pump();

    final textWidgets = find.descendant(
      of: todosListContainerFinder,
      matching: find.byType(Text),
    );
    for (final element in textWidgets.evaluate()) {
      final textWidget = element.widget as Text;
      print('Text widget content: ${textWidget.data}');
    }
  });
  testWidgets('Check the search function and print input value',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();

    final searchFieldFinder = find.byKey(Key('search_input_field'));
    expect(searchFieldFinder, findsOneWidget);

    await tester.tap(searchFieldFinder);
    await tester.pump(Duration(milliseconds: 400));

    // Enter text
    await tester.enterText(searchFieldFinder, 'Check Emails');
    await tester.pump(Duration(milliseconds: 400));

    final textField = tester.widget(searchFieldFinder) as TextField;
    final inputValue = textField.controller?.text ?? '';
    print('Text input field value: $inputValue');

    await Future.delayed(Duration(seconds: 5));
    final todosListContainerFinder = find.byKey(Key('todos list'));
    expect(todosListContainerFinder, findsOneWidget);

    await tester.drag(todosListContainerFinder, Offset(0, -500));
    await tester.pumpAndSettle();

    final textWidgets = find.descendant(
      of: todosListContainerFinder,
      matching: find.byType(Text),
    );
    for (final element in textWidgets.evaluate()) {
      final textWidget = element.widget as Text;
      print('Text widget content: ${textWidget.data}');
    }
  });
}


// flutter drive \
//   --driver=test_driver/perf_driver.dart \
//   --target=integration_test/performance_test.dart \
//   --profile \
//   --write-sksl-on-exit=integration_test/results/performance_summary.sksl.json \
//   --cache-sksl
