import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('App name - home', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    test('Find and tap on todos list container', () async {
      final timeline = await driver!.traceAction(() async {
        // Wait for the todos list container to be visible
        final todosListFinder = find.byValueKey('todos list');
        await driver!.waitFor(todosListFinder, timeout: Duration(seconds: 10));

        // Debug print to ensure the widget is found
        print('Todos list container found');

        // Tap on the todos list container
        await driver!.tap(todosListFinder);
        print('Tapped on todos list container');

        // Optionally, wait for a result if needed
        // await driver!.waitFor(find.byValueKey('some_result_key'));
      });

      // Write summary to a file
      try {
        final summary = TimelineSummary.summarize(timeline);
        await summary.writeTimelineToFile('ui_timeline', pretty: true);
        print('Timeline summary written to file.');
      } catch (e) {
        print('Error writing timeline summary: $e');
      }
    });
  });
}
