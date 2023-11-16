import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Flutter Driver test', () {
    late FlutterDriver driver; // Use 'late' keyword for non-nullable variable

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver
          .close(); // You can directly call driver.close() without checking for null
    });

    test('Check Flutter Driver health', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });

    test('Tap on the button, enter text', () async {
      final buttonFinder = find.byValueKey('add_data');

      await driver.tap(buttonFinder);
      await driver.enterText('Hello');
      await driver.waitFor(find.text('Hello'));
    });
  });
}
