import 'package:flutter_test/flutter_test.dart';
import 'package:testing/main.dart';

void main() {
  testWidgets('Widgets Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    final titleFinder = find.text('Fetch Data Example');
    expect(titleFinder, findsOneWidget);
  });
}
