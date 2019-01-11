import 'package:test/test.dart';
import 'package:testing/main.dart';

import './mockData.dart';

void main() {
  test("parse data api", () async {
    var rs = await fetchPost();
    Map response = mockData;
    expect(rs.id, response['id']);
    expect(rs.title, response['title']);
    expect(rs.body, response['body']);
    expect(rs.userId, response['userId']);
  });
}
