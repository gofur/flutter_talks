import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:testing/main.dart';

import './mockData.dart';

// Create a MockClient using the Mock class provided by the Mockito package.
// We will create new instances of this class in each test.
class MockClient extends Mock implements http.Client {}

void main() {
  group('Mockito test', () {
    test('returns a Post if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

      expect(await fetchPost(), isInstanceOf<Post>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchPost(), throwsException);
    });
  });

  test("parse data api", () async {
    var rs = await fetchPost();
    Map response = mockData;
    expect(rs.id, response['id']);
    expect(rs.title, response['title']);
    expect(rs.body, response['body']);
    expect(rs.userId, response['userId']);
  });
}
