import 'package:rxdart/rxdart.dart';
import 'package:test/test.dart';

void main() {
  group("Stream testing", () {
    test('Stream Fetch Data', () {
      expect(Stream.fromFuture(getData()), emits("This a test data"));
    });

    test('Stream Iterable', () {
      expect(
          Stream.fromIterable([1, 2, 3]), emitsInOrder([1, 2, 3, emitsDone]));
    });

    test('Stream emits an error', () {
      expect(Observable.error(new Exception()), emitsError(isException));
    });
  });
}

Future<String> getData() async {
  await Future.delayed(Duration(seconds: 5)); //Mock delay
  print("Fetched Data");
  return "This a test data";
}
