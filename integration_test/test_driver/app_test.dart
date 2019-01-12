// Imports the Flutter Driver API
import 'package:flutter_driver/flutter_driver.dart';
import 'package:ozzie/ozzie.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    // First, define the Finders. We can use these to locate Widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');

    FlutterDriver driver;
    Ozzie ozzie;

    // Connect to the Flutter driver before running any tests
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      ozzie = Ozzie.initWith(driver, groupName: 'counter');
    });

    // Close the connection to the driver after the tests have completed
    tearDownAll(() async {
      if (driver != null) driver.close();
      ozzie.generateHtmlReport();
    });

    test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(counterTextFinder), "0");
      await ozzie.takeScreenshot('initial_counter_is_0');
    });

    test('increments the counter', () async {
      // First, tap on the button
      await driver.tap(buttonFinder, timeout: Duration(minutes: 2));

      // Then, verify the counter text has been incremented by 1
      expect(await driver.getText(counterTextFinder), "1");
      await ozzie.takeScreenshot('counter_is_1');
    });
  });
}
